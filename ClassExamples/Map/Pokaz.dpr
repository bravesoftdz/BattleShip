program Pokaz;

uses
  Forms,
  Basis in 'Basis.pas' {Form1},
  Map in 'Map.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
