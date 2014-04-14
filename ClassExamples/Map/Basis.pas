unit Basis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Second, ScktComp;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    lbl1: TLabel;
    btn1: TButton;
    lbl2: TLabel;
    ClientSocket1: TClientSocket;
    procedure btn1Click(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  if edt1.Text <> '' then begin
    User.EntName(edt1.Text);
    lbl1.Hide;
    edt1.Hide;
    lbl2.Visible:=True;
{  Подключение к серверу
  Расстановка кораблей -}
//    ClientSocket1.Port:=;
//    ClientSocket1.Address:=;
    ClientSocket1.Active:=true;
  end else begin
    ShowMessage('Введите имя');
  end;

end;

procedure TForm1.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
//    Net.sendStartGame;
    Form2.Visible:=True;
    Form1.Hide;
    Form2.Label2.Caption:=User.WriteName;
{если нет то...
  ShowMessage('Сервер недоступен');}

end;

end.
