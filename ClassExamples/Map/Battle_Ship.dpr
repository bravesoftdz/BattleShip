program Battle_Ship;

uses
  Forms,
  Basis in 'Basis.pas' {Form1},
  Second in 'Second.pas' {Form2},
  Fight in 'Fight.pas' {Form3},
  Konez in 'Konez.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
