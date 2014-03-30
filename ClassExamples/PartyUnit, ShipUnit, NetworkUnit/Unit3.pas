unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, PartyUnit;

type
  TForm3 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  Party : TParty;

implementation

uses Unit5;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Add('Ходит ' + Party.getWhoStep);
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Party.setWhoStep(StrToInt(Edit1.Text));
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  Party.setNextStep;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  Memo1.Lines.Add('Ошибка: не поддреживаемый формат!');
  Memo1.Lines.Add('   Функция возвращает массив кораблей игрока.');
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  Party := TParty.Create;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
     Party.setPlayerParameters(StrToInt(Edit1.Text), Edit2.Text, Edit3.Text)
end;

procedure TForm3.Button6Click(Sender: TObject);
begin
  Memo1.Lines.Add('Имя - ' + Party.getPlayerParameters(StrToInt(Edit1.Text)).Name);
  Memo1.Lines.Add('Адрес - ' + Party.getPlayerParameters(StrToInt(Edit1.Text)).Address);
end;

procedure TForm3.Button7Click(Sender: TObject);
var FileName : string;
begin
  Form5.Visible := true;
  FileName := Application.ExeName;
  Delete(FileName, length(FileName) - 11, 12);
  FileName := FileName + 'help2.txt';
  Form5.Memo1.Lines.LoadFromFile(FileName);
end;

end.
