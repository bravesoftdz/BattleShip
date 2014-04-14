unit Konez;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses
  Second, Fight;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  Form2.Label2.Caption:=User.WriteName;
  Form4.Hide;
  Form2.Refresh;
  Form2.Visible:=True;
  Form3.Refresh;
  MapMy.Free;
  MapEnemy.Free;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

end.
