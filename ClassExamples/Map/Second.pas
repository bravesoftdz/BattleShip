unit Second;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Map, Grids, StdCtrls, User, Fight;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    btn1: TButton;
    btn2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  MapMy, MapEnemy:TMap;
  s, k:TCoord;
  User:TUser;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
var i, j:integer;
begin
{Отрисовывает поле}

  User:=TUser.Create;
  MapMy:=TMap.Create;
  StringGrid1.ColCount := 11;
  StringGrid1.RowCount := 11;
  StringGrid1.RowHeights[0] := 16;
  StringGrid1.ColWidths[0]:=16;
  with StringGrid1 do begin
    for i:=1 to 10 do begin
      Cells[0, i]:=inttostr(i);
      RowHeights[i]:=16;
      ColWidths[i]:=16;
    end;
    Cells[1, 0]:='а';
    Cells[2, 0]:='б';
    Cells[3, 0]:='в';
    Cells[4, 0]:='г';
    Cells[5, 0]:='д';
    Cells[6, 0]:='е';
    Cells[7, 0]:='ж';
    Cells[8, 0]:='з';
    Cells[9, 0]:='и';
    Cells[10, 0]:='к';
    Label7.Caption:=inttostr(4-Cship[1, 0]);
    Label8.Caption:=inttostr(3-Cship[2, 0]);
    Label9.Caption:=inttostr(2-Cship[3, 0]);
    Label10.Caption:=inttostr(1-Cship[4, 0]);
  end;
end;

procedure TForm2.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var  pos : TCoord;
begin
if StringGrid1.Cells[ACol, ARow] = '' then begin
    with StringGrid1 do begin
        pos.x := ACol;
        pos.y := ARow;
        case MapMy.Draw(pos) of
          0:Canvas.Brush.Color := RGB(240, 255, 255);
          2:Canvas.Brush.Color := RGB(0, 191, 255);
          5:Canvas.Brush.Color := RGB(139, 139, 0);
        end;
        Canvas.FillRect(Rect);
    end;

  end;
end;

procedure TForm2.StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i, j, d : integer;
    b:Boolean;
begin
{Узнаёт координаты корабля, после чего передаёт
их в класс. Там эта информация записывается в массив.
После чего выводим весь массив...}
  d:=0;
  for i:=StringGrid1.Selection.Left to StringGrid1.Selection.Right do begin
    for j:=StringGrid1.Selection.Top to StringGrid1.Selection.Bottom do begin

      if d = 0 then begin
        d:=d+1;
        s.x:=i;
        s.y:=j;
        k.x:=i;
        k.y:=j;
      end else begin
        k.x:=i;
        k.y:=j;
      end;
    end;
  end;

  b:=MapMy.PlaceShip(s, k);

  if b then begin
    StringGrid1.Refresh;
  end else begin
    ShowMessage('Ошибка');
    StringGrid1.Refresh;
  end;
  Label7.Caption:=inttostr(4-Cship[1, 0]);
  Label8.Caption:=inttostr(3-Cship[2, 0]);
  Label9.Caption:=inttostr(2-Cship[3, 0]);
  Label10.Caption:=inttostr(1-Cship[4, 0]);
end;



procedure TForm2.btn1Click(Sender: TObject);
begin
{Обнуляет массив и выводит его...}
  MapMy.Create;
  StringGrid1.Refresh;
  Label7.Caption:=inttostr(4-Cship[1, 0]);
  Label8.Caption:=inttostr(3-Cship[2, 0]);
  Label9.Caption:=inttostr(2-Cship[3, 0]);
  Label10.Caption:=inttostr(1-Cship[4, 0]);
end;

procedure TForm2.btn2Click(Sender: TObject);
  var i ,j:integer;
begin
  if (Label7.Caption = '0') and (Label8.Caption = '0') and (Label9.Caption = '0')
  and (Label8.Caption = '0') then begin
    MapMy.AllArrangement;
    StringGrid1.Refresh;
    Label7.Hide;
    Label8.Hide;
    Label9.Hide;
    Label10.Hide;
    Label1.Visible:=True;
    //Получение кол-ва кораблей противника

    Net.sendShipLocations(MapMy.GetAllCoord);
        //User.EntShips();
    //Ожидание начала боя
    Form2.Hide;
    Form3.Visible:=True;
    Form3.Label2.Caption:=User.WriteName;
  end else begin

    ShowMessage('Сначала расставьте все корабли');
  end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

end.
