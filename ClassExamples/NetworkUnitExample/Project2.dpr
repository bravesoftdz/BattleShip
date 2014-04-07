program Project2;



uses
  Forms,
  Unit1 in 'Unit1.pas' {Form2},
  NetworkUnit in 'NetworkUnit.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
