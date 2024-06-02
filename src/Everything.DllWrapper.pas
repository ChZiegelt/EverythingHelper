// A wrapper for Everything from voidtools SDK to use with Delphi
// https://www.voidtools.com/support/everything/sdk/
//
// Initial ideas from Forum post: https://www.voidtools.com/forum/viewtopic.php?t=4292
//
// Unit created by Christian Ziegelt
// 2024.06.02
//
unit Everything.DllWrapper;

interface

uses
    WinApi.Windows
  ;


type
  //  Filetime struct of C++
  _FILETIME = record
    dwLowDateTime: UInt32;
    dwHighDateTime: UInt32;
  end;

  {$EXTERNALSYM _FILETIME}
  FILETIME = _FILETIME;

  {$EXTERNALSYM FILETIME}
  PFILETIME = ^FILETIME;

  {$EXTERNALSYM PFILETIME}
  LPFILETIME = PFILETIME;

  {$EXTERNALSYM LPFILETIME}
  TFileTime = FILETIME;



const

  EVERYTHING_OK =                                    0;  //      no error detected
  EVERYTHING_ERROR_MEMORY =                          1;  //      out of memory.
  EVERYTHING_ERROR_IPC =                             2;  //      Everything search client is not running
  EVERYTHING_ERROR_REGISTERCLASSEX =                 3;  //      unable to register window class.
  EVERYTHING_ERROR_CREATEWINDOW =                    4;  //      unable to create listening window
  EVERYTHING_ERROR_CREATETHREAD =                    5;  //      unable to create listening thread
  EVERYTHING_ERROR_INVALIDINDEX =                    6;  //      invalid index
  EVERYTHING_ERROR_INVALIDCALL =                     7;  //      invalid call
  EVERYTHING_ERROR_INVALIDREQUEST =                  8;  //      invalid request data, request data first.
  EVERYTHING_ERROR_INVALIDPARAMETER =                9;  //      bad parameter.

  EVERYTHING_SORT_NAME_ASCENDING =                   1;
  EVERYTHING_SORT_NAME_DESCENDING =                  2;
  EVERYTHING_SORT_PATH_ASCENDING =                   3;
  EVERYTHING_SORT_PATH_DESCENDING =                  4;
  EVERYTHING_SORT_SIZE_ASCENDING =                   5;
  EVERYTHING_SORT_SIZE_DESCENDING =                  6;
  EVERYTHING_SORT_EXTENSION_ASCENDING =              7;
  EVERYTHING_SORT_EXTENSION_DESCENDING =             8;
  EVERYTHING_SORT_TYPE_NAME_ASCENDING =              9;
  EVERYTHING_SORT_TYPE_NAME_DESCENDING =             10;
  EVERYTHING_SORT_DATE_CREATED_ASCENDING =           11;
  EVERYTHING_SORT_DATE_CREATED_DESCENDING =          12;
  EVERYTHING_SORT_DATE_MODIFIED_ASCENDING =          13;
  EVERYTHING_SORT_DATE_MODIFIED_DESCENDING =         14;
  EVERYTHING_SORT_ATTRIBUTES_ASCENDING =             15;
  EVERYTHING_SORT_ATTRIBUTES_DESCENDING =            16;
  EVERYTHING_SORT_FILE_LIST_FILENAME_ASCENDING =     17;
  EVERYTHING_SORT_FILE_LIST_FILENAME_DESCENDING =    18;
  EVERYTHING_SORT_RUN_COUNT_ASCENDING =              19;
  EVERYTHING_SORT_RUN_COUNT_DESCENDING =             20;
  EVERYTHING_SORT_DATE_RECENTLY_CHANGED_ASCENDING =  21;
  EVERYTHING_SORT_DATE_RECENTLY_CHANGED_DESCENDING = 22;
  EVERYTHING_SORT_DATE_ACCESSED_ASCENDING =          23;
  EVERYTHING_SORT_DATE_ACCESSED_DESCENDING =         24;
  EVERYTHING_SORT_DATE_RUN_ASCENDING =               25;
  EVERYTHING_SORT_DATE_RUN_DESCENDING =              26;

  EVERYTHING_REQUEST_FILE_NAME =                           $00000001;
  EVERYTHING_REQUEST_PATH =                                $00000002;
  EVERYTHING_REQUEST_FULL_PATH_AND_FILE_NAME =             $00000004;
  EVERYTHING_REQUEST_EXTENSION =                           $00000008;
  EVERYTHING_REQUEST_SIZE =                                $00000010;
  EVERYTHING_REQUEST_DATE_CREATED =                        $00000020;
  EVERYTHING_REQUEST_DATE_MODIFIED =                       $00000040;
  EVERYTHING_REQUEST_DATE_ACCESSED =                       $00000080;
  EVERYTHING_REQUEST_ATTRIBUTES =                          $00000100;
  EVERYTHING_REQUEST_FILE_LIST_FILE_NAME =                 $00000200;
  EVERYTHING_REQUEST_RUN_COUNT =                           $00000400;
  EVERYTHING_REQUEST_DATE_RUN =                            $00000800;
  EVERYTHING_REQUEST_DATE_RECENTLY_CHANGED =               $00001000;
  EVERYTHING_REQUEST_HIGHLIGHTED_FILE_NAME =               $00002000;
  EVERYTHING_REQUEST_HIGHLIGHTED_PATH =                    $00004000;
  EVERYTHING_REQUEST_HIGHLIGHTED_FULL_PATH_AND_FILE_NAME = $00008000;

  EVERYTHING_TARGET_MACHINE_X86 = 1;
  EVERYTHING_TARGET_MACHINE_X64 = 2;
  EVERYTHING_TARGET_MACHINE_ARM = 3;


const
  Dll = 'Everything64.dll';


// Everything.dll 64bit exported functions
  procedure Everything_CleanUp( );
            stdcall; external Dll index 1;

  function  Everything_DeleteRunHistory( ): Boolean;
            stdcall; external Dll index 2;

  function  Everything_Exit( ): Boolean;
            stdcall; external Dll index 3;

  function  Everything_GetBuildNumber( ): UInt32;
            stdcall; external Dll index 4;

  function  Everything_GetLastError( ): UInt32;
            stdcall; external Dll index 5;

  function  Everything_GetMajorVersion( ): UInt32;
            stdcall; external Dll index 6;

  function  Everything_GetMatchCase( ): Boolean;
            stdcall; external Dll index 7;

  function  Everything_GetMatchPath( ): Boolean;
            stdcall; external Dll index 8;

  function  Everything_GetMatchWholeWord( ): Boolean;
            stdcall; external Dll index 9;

  function  Everything_GetMax( ): Boolean;
            stdcall; external Dll index 10;

  function  Everything_GetMinorVersion( ): UInt32;
            stdcall; external Dll index 11;

  function  Everything_GetNumFileResults( ): Uint32;
            stdcall; external Dll index 12;

  function  Everything_GetNumFolderResults( ): UInt32;
            stdcall; external Dll index 13;

  function  Everything_GetNumResults( ): UInt32;
            stdcall; external Dll index 14;

  function  Everything_GetOffset( ): UInt32;
            stdcall; external Dll index 15;

  function  Everything_GetRegex( ): Boolean;
            stdcall; external Dll index 16;

  function  Everything_GetReplyID( ): UInt32;
            stdcall; external Dll index 17;

  function  Everything_GetReplyWindow( ): HWND;
            stdcall; external Dll index 18;

  function  Everything_GetRequestFlags( ): UInt32;
            stdcall; external Dll index 19;

  function  Everything_GetResultAttributes( dwIndex: UInt32 ): UInt32;
            stdcall; external Dll index 20;

  function  Everything_GetResultDateAccessed( dwIndex: UInt32; lpDateAccessed: LPFILETIME ): Boolean ;
            stdcall; external Dll index 21;

  function  Everything_GetResultDateCreated( dwIndex: UInt32; lpDateCreated: LPFILETIME ): Boolean ;
            stdcall; external Dll index 22;

  function  Everything_GetResultDateModified( dwIndex: UInt32; lpDateModified: LPFILETIME ): Boolean ;
            stdcall; external Dll index 23;

  function  Everything_GetResultDateRecentlyChanged( dwIndex: UInt32; lpDateRecentlyChanged: LPFILETIME  ): Boolean;
            stdcall; external Dll index 24;

  function  Everything_GetResultDateRun( dwIndex: UInt32; lpDateRun: LPFILETIME  ): Boolean;
            stdcall; external Dll index 25;

  function  Everything_GetResultExtensionA( dwIndex: UInt32 ): LPCSTR;
            stdcall; external Dll index 26;

  function  Everything_GetResultExtensionW( dwIndex: UInt32 ): LPCWSTR;
            stdcall; external Dll index 27;

  function  Everything_GetResultFileListFileNameA( dwIndex: UInt32 ): LPCSTR;
            stdcall; external Dll index 28;

  function  Everything_GetResultFileListFileNameW( dwIndex: UInt32 ): LPCWSTR;
            stdcall; external Dll index 29;

  function  Everything_GetResultFileNameA( dwIndex: UInt32 ): LPCSTR;
            stdcall; external Dll index 30;

  function  Everything_GetResultFileNameW( dwIndex: UInt32 ): LPCWSTR;
            stdcall; external Dll index 31;

  function  Everything_GetResultFullPathNameA( dwIndex: UInt32; buf: LPSTR; bufsize: UInt32 ): UInt32;
            stdcall; external Dll index 32;

  function  Everything_GetResultFullPathNameW( dwIndex: UInt32; wbuf: LPWSTR; wbuf_size_in_wchars: UInt32 ): UInt32;
            stdcall; external Dll index 33;

  function  Everything_GetResultHighlightedFileNameA( dwIndex: UInt32 ): LPCSTR;
            stdcall; external Dll index 34;

  function  Everything_GetResultHighlightedFileNameW( dwIndex: UInt32 ): LPCWSTR;
            stdcall; external Dll index 35;

  function  Everything_GetResultHighlightedFullPathAndFileNameA( dwIndex: UInt32 ): LPCSTR;
            stdcall; external Dll index 36;

  function  Everything_GetResultHighlightedFullPathAndFileNameW( dwIndex: UInt32 ): LPCWSTR;
            stdcall; external Dll index 37;

  function  Everything_GetResultHighlightedPathA( dwIndex: UInt32 ): LPCSTR;
            stdcall; external Dll index 38;

  function  Everything_GetResultHighlightedPathW( dwIndex: UInt32 ): LPCWSTR;
            stdcall; external Dll index 39;

  function  Everything_GetResultListRequestFlags( ): UInt32;
            stdcall; external Dll index 40;

  function  Everything_GetResultListSort( ): UInt32;
            stdcall; external Dll index 41;

  function  Everything_GetResultPathA( dwIndex: UInt32 ): LPCSTR;
            stdcall; external Dll index 42;

  function  Everything_GetResultPathW( dwIndex: UInt32 ): LPCWSTR;
            stdcall; external Dll index 43;

  function  Everything_GetResultRunCount( dwIndex: UInt32 ): UInt32;
            stdcall; external Dll index 44;

  function  Everything_GetResultSize( dwIndex: UInt32; lpSize: PInt64 ): Boolean;
            stdcall; external Dll index 45; // name 'Everything_GetResultSize';

  function  Everything_GetRevision( ): UInt32;
            stdcall; external Dll index 46;

  function  Everything_GetRunCountFromFileNameA( lpFileName: LPCSTR ): UInt32;
            stdcall; external Dll index 47;

  function  Everything_GetRunCountFromFileNameW( lpFileName: LPCWSTR ): UInt32;
            stdcall; external Dll index 48;

  function  Everything_GetSearchA( ): LPCSTR;
            stdcall; external Dll index 49;

  function  Everything_GetSearchW( ): LPCWSTR;
            stdcall; external Dll index 50;

  function  Everything_GetSort( ): UInt32;
            stdcall; external Dll index 51;

  function  Everything_GetTargetMachine( ): UInt32;
            stdcall; external Dll index 52;

  function  Everything_GetTotFileResults( ): UInt32;
            stdcall; external Dll index 53;

  function  Everything_GetTotFolderResults( ): UInt32;
            stdcall; external Dll index 54;

  function  Everything_GetTotResults( ): UInt32;
            stdcall; external Dll index 55;

  function  Everything_IncRunCountFromFileNameA( lpFileName: LPCSTR ): UInt32;
            stdcall; external Dll index 56;

  function  Everything_IncRunCountFromFileNameW( lpFileName: LPCWSTR ): UInt32;
            stdcall; external Dll index 57;

  function  Everything_IsAdmin( ): Boolean;
            stdcall; external Dll index 58;

  function  Everything_IsAppData( ): Boolean;
            stdcall; external Dll index 59;

  function  Everything_IsDBLoaded( ): Boolean;
            stdcall; external Dll index 60;

  function  Everything_IsFastSort( sortType: UInt32 ): Boolean;
            stdcall; external Dll index 61;

  function  Everything_IsFileInfoIndexed( fileInfoType: UInt32 ): Boolean;
            stdcall; external Dll index 62;

  function  Everything_IsFileResult( dwIndex: UInt32 ): Boolean;
            stdcall; external Dll index 63;

  function  Everything_IsFolderResult( dwIndex: UInt32 ): Boolean;
            stdcall; external Dll index 64;

  function  Everything_IsQueryReply( Message: UInt64; wParam: WPARAM; lParam: LPARAM; dwId: UInt32): Boolean;
            stdcall; external Dll index 65;

  function  Everything_IsVolumeResult( dwIndex: UInt32 ): Boolean;
            stdcall; external Dll index 66;

//  function  Everything_MSIExitAndStopService( void *msihandle ): UInt32; stdcall; external Dll index 67;
//  function  Everything_MSIStartService( void *msihandle): UInt32; stdcall; external Dll index 68;

  function  Everything_QueryA( bWait: Boolean ): Boolean;
            stdcall; external Dll index 69;

  function  Everything_QueryW( bWait: Boolean ): Boolean;
            stdcall; external Dll index 70;

  function  Everything_RebuildDB( ): Boolean;
            stdcall; external Dll index 71;

  procedure Everything_Reset( ); stdcall;
            external Dll index 72;

  function  Everything_SaveDB( ): Boolean;
            stdcall; external Dll index 73;

  function  Everything_SaveRunHistory( ): Boolean;
            stdcall; external Dll index 74;

  function  Everything_SetMatchCase( bEnable: Boolean ): Boolean;
            stdcall; external Dll index 75;

  function  Everything_SetMatchPath( bEnable: Boolean ): Boolean;
            stdcall; external Dll index 76;

  function  Everything_SetMatchWholeWord( bEnable: Boolean ): Boolean;
            stdcall; external Dll index 77;

  procedure Everything_SetMax( dwMax: UInt32 );
            stdcall; external Dll index 78;

  procedure Everything_SetOffset( dwOffset: UInt32 );
            stdcall; external Dll index 79;

  function  Everything_SetRegex( bEnable: Boolean ): Boolean;
            stdcall; external Dll index 80;

  procedure Everything_SetReplyID( dwId: UInt32);
            stdcall; external Dll index 81;

  procedure Everything_SetReplyWindow( hWnd: HWND);
            stdcall; external Dll index 82;

  procedure Everything_SetRequestFlags( dwRequestFlags: UInt32 );
            stdcall; external Dll index 83;

  function  Everything_SetRunCountFromFileNameA( lpFileName: LPCSTR; dwRunCount: UInt32 ): Boolean;
            stdcall; external Dll index 84;

  function  Everything_SetRunCountFromFileNameW( lpFileName: LPCWSTR; dwRunCount: UInt32 ): Boolean;
            stdcall; external Dll index 85;

  procedure Everything_SetSearchA( lpString: LPCSTR);
            stdcall; external Dll index 86;

  procedure Everything_SetSearchW( lpString: LPCWSTR );
            stdcall; external Dll index 87;

  procedure Everything_SetSort( dwSort: UInt32 );
            stdcall; external Dll index 88;

  procedure Everything_SortResultsByPath( );
            stdcall; external Dll index 89;

  function  Everything_UpdateAllFolderIndexes( ): Boolean;
            stdcall; external Dll index 90;



implementation

end.
