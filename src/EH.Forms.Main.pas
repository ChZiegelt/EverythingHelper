unit EH.Forms.Main;

interface

uses
    Winapi.Windows
  , Winapi.Messages

  , System.SysUtils
  , System.Variants
  , System.Classes
  , System.IOUtils

  , System.Generics.Collections
  , System.Generics.Defaults

  , Vcl.Graphics
  , Vcl.Controls
  , Vcl.Forms
  , Vcl.Dialogs
  , Vcl.StdCtrls

  , Everything.DllWrapper

  , System.Hash, Vcl.Grids
  ;

type
  TFileRecord = class
  public
    FileName: String;
    Path: String;
    Ext: String;
    Size: UInt64;
    DateCreated: TDateTime;
    DateAccessed: TDateTime;
    DateModified: TDateTime;
    HashSHA256: String;
  public
    procedure RetrieveHash;
    function FullFileName: String;
  public
    Constructor Create( const AFullFileName: String ); overload;
    Constructor Create( const AFilePath: String; const AFileName: String ); overload;
  end;

  TFileRecordDB = TDictionary< String, TFileRecord >;

type

  TForm1 = class(TForm)
    edSearchFilter: TEdit;
    sgResults: TStringGrid;
    procedure edSearchFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FileRecords: TFileRecordDB;

  public
    { Public declarations }
  end;



var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.edSearchFilterKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i: UInt32;
  ResultCount: UInt32;
  SearchString: String;
  LFileRecord: TFileRecord;
  lFileName: String;
  lFileNameBytes: TBytes;
  lFileNameSize: UInt32;
begin
  if Key = VK_RETURN then
  begin
    sgResults.RowCount := 2;
    sgResults.Rows[1].Clear;

    sgResults.Rows[0].Add('Filename');

    FileRecords.Clear;

    Everything_CleanUp();
    Everything_SetRequestFlags(    EVERYTHING_REQUEST_FILE_NAME
                                or EVERYTHING_REQUEST_PATH
                                or EVERYTHING_REQUEST_SIZE
                                or EVERYTHING_REQUEST_EXTENSION
                                or EVERYTHING_REQUEST_DATE_CREATED
                                or EVERYTHING_REQUEST_DATE_MODIFIED
                              );

    SearchString := edSearchFilter.Text;
    Everything_SetSearchW( PWideChar(SearchString) );

    if not Everything_QueryW( True ) then
       exit;

    ResultCount := Everything_GetNumResults();

    FileRecords.Capacity := ResultCount;
    sgResults.RowCount := ResultCount +1;

    for i := 0 to ResultCount -1 do
    begin
      //LFileRecord := TFileRecord.Create( Everything_GetResultPathW(i), Everything_GetResultFileNameW(i) );
      //lFileNameSize := Everything_GetResultFullPathNameW( i, nil, 999999 );
      //setLength( lFileNameBytes, lFileNameSize );
      //lFileNameSize := Everything_GetResultFullPathNameW( i, @lFileNameBytes[0], lFileNameSize );
      //lFileName := TEncoding.ANSI.GetString( lFileNameBytes );
      //LFileRecord := TFileRecord.Create( lFileName );

      LFileRecord := TFileRecord.Create('');
      LFileRecord.Path     := Everything_GetResultPathW(i);
      LFileRecord.FileName := Everything_GetResultFileNameW(i);

      FileRecords.Add( LFileRecord.FullFileName, LFileRecord );
      LFileRecord.RetrieveHash();

      sgResults.Rows[i+1].Add( LFileRecord.FileName );
      sgResults.Rows[i+1].Add( LFileRecord.Path );
      sgResults.Rows[i+1].Add( IntToStr(LFileRecord.Size) );
      sgResults.Rows[i+1].Add( '' );
      sgResults.Rows[i+1].Add( LFileRecord.HashSHA256 );
    end;

  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FileRecords := TFileRecordDB.Create;

  sgResults.RowCount := 2;
  sgResults.Rows[1].Clear;

  sgResults.Rows[0].Add('Filename');
  sgResults.Rows[0].Add('Path');
  sgResults.Rows[0].Add('Size');
  sgResults.Rows[0].Add('Date Modified');
  sgResults.Rows[0].Add('Hash');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FileRecords);
end;


{ TFileRecord }

constructor TFileRecord.Create( const AFullFileName: String);
begin
  if not AFullFileName.IsEmpty  then
  begin
    FileName := TPath.GetFileName( AFullFileName );
    Path := TPath.GetDirectoryName( AFullFileName );
  end;
end;

constructor TFileRecord.Create( const AFilePath: String; const AFileName: String);
begin
  FileName := AFileName;
  Path := AFilePath;
end;


function TFileRecord.FullFileName: String;
begin
  Result := Self.Path + '\' + Self.FileName;
end;

procedure TFileRecord.RetrieveHash;
begin
  HashSHA256 := THashSHA2.GetHashStringFromFile( Self.FullFileName );
end;


end.
