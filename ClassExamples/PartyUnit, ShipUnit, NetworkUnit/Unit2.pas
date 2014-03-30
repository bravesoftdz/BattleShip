unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShipUnit, StdCtrls;

type
  TForm2 = class(TForm)
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
    Button7: TButton;
    Edit4: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Pularations }
  end;

var
  Form2: TForm2;
  Ship : TShip;

implementation

uses Unit1, Unit5;

//uses StrUtils;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
  Ship := TShip.Create;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  Number : byte;
  status : boolean;
begin
  Number := StrToInt(Edit1.Text);
  if StrToInt(Edit2.Text) <> 0 then status := True
                               else status := False;
  Ship.setDeckStatus(Number, status);
end;

procedure TForm2.Button1Click(Sender: TObject);
var Count : byte;
begin
  Count := StrToInt(Edit1.Text);
  Ship.setDecksCount(Count);
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  Ship.setDeckLocation(StrToInt(Edit1.Text), StrToInt(Edit2.Text), StrToInt(Edit3.Text));
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  Form1.Visible := true;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  Memo1.Lines.Add('Кол-во не взорваных палуб' + IntToStr(Ship.getHealth));
end;

procedure TForm2.Button7Click(Sender: TObject);
var FileName: string;
begin
  Form5.Visible := true;
  FileName := Application.ExeName;
  Delete(FileName, length(FileName) - 11, 12);
  FileName := FileName + 'help1.txt';
  Form5.Memo1.Lines.LoadFromFile(FileName);
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  Memo1.Lines.Add('Кол-во палуб = ' + IntToStr(Ship.getDecksCount));
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  Memo1.Lines.Add('---------------------------------------------');
  if Ship.getDeck(StrToInt(Edit1.Text)).Status
    then Memo1.Lines.Add('Состояние - не взорвана.')
    else Memo1.Lines.Add('Состояние - взорвана.');
  Memo1.Lines.Add('Координата X - ' + IntToStr(Ship.getDeck(StrToInt(Edit1.Text)).X));
  Memo1.Lines.Add('Координата Y - ' + IntToStr(Ship.getDeck(StrToInt(Edit1.Text)).Y));
  Memo1.Lines.Add('---------------------------------------------');    
end;

end.
