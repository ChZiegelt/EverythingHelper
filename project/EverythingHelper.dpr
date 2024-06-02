program EverythingHelper;

uses
  Vcl.Forms,
  EH.Forms.Main in '..\src\EH.Forms.Main.pas' {Form1},
  Everything.DllWrapper in '..\src\Everything.DllWrapper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
