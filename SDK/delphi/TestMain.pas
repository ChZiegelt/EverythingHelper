unit TestMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, VirtualTrees, XPMan, ImgList, System.ImageList;

type
  TForm1 = class(TForm)
    btn1: TButton;
    VST1: TVirtualStringTree;
    xpmnfst1: TXPManifest;
    il1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure VST1GetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure VST1GetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//==============================================================================
const
  Dll = 'Everything32.dll';

procedure Everything_SetSearchA(lpString: LPCTSTR); stdcall; external Dll index 35;
procedure Everything_QueryA(bWait: BOOL); stdcall; external Dll index 25;
function Everything_GetNumResults: DWORD; stdcall; external Dll index 8;

function Everything_GetResultFileNameA(index: DWORD): LPCTSTR; stdcall; external Dll index 13;
function Everything_GetResultPathA(index: DWORD): LPCTSTR; stdcall; external Dll index 15;

function Everything_IsFolderResult(index: DWORD): BOOL; stdcall external Dll index 23;

 //=============================================================================

procedure TForm1.FormCreate(Sender: TObject);
begin
  btn1.Click;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  Everything_SetSearchA('restorator');
  Everything_QueryA(True);
  VST1.RootNodeCount := Everything_GetNumResults;

  Caption := IntToStr(VST1.RootNodeCount);
end;

procedure TForm1.VST1GetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
begin
  case TextType of
    ttNormal:
      case Column of
        0: CellText := Everything_GetResultFileNameA(Node.Index);
        1: CellText := Everything_GetResultPathA(Node.Index); 
      end;
    ttStatic:;
  end;
end;                

procedure TForm1.VST1GetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer);
begin
  case Kind of
    ikNormal,ikSelected:
      case Column of
        0: if Everything_IsFolderResult(Node.Index) then
             ImageIndex := 0;
      end;
  end;
end;

end.
