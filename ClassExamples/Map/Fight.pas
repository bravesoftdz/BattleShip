unit Fight;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Konez;

type
  TForm3 = class(TForm)
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses
  Second, Map;

procedure TForm3.FormCreate(Sender: TObject);
var i,j:Integer;
begin

  Label2.Caption:=User.WriteName;
  MapEnemy:=Map.TMap.Create;
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
  end;

  StringGrid2.ColCount := 11;
  StringGrid2.RowCount := 11;
  StringGrid2.RowHeights[0] := 16;
  StringGrid2.ColWidths[0]:=16;
  with StringGrid2 do begin
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
  end;
end;

procedure TForm3.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var  pos : Map.TCoord;
begin
if StringGrid1.Cells[ACol, ARow] = '' then begin
    with StringGrid1 do begin
        pos.x := ACol;
        pos.y := ARow;
        case MapMy.Draw(pos) of
          0:Canvas.Brush.Color := RGB(240, 255, 255);
          2:Canvas.Brush.Color := RGB(0, 191, 255);
          5:Canvas.Brush.Color := RGB(139, 139, 0);
          3:Canvas.Brush.Color := RGB(173, 255, 47);
          4:Canvas.Brush.Color := RGB(255, 69, 0);
        end;
        Canvas.FillRect(Rect);
    end;

  end;
end;

procedure TForm3.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var  pos : TCoord;
begin
if StringGrid2.Cells[ACol, ARow] = '' then begin
    with StringGrid2 do begin
        pos.x := ACol;
        pos.y := ARow;
        case MapEnemy.Draw(pos) of
          0:Canvas.Brush.Color := RGB(240, 255, 255);
          2:Canvas.Brush.Color := RGB(0, 191, 255);
          5:Canvas.Brush.Color := RGB(139, 139, 0);
          3:Canvas.Brush.Color := RGB(173, 255, 47);
          4:Canvas.Brush.Color := RGB(255, 69, 0);
        end;
        Canvas.FillRect(Rect);
    end;

  end;
end;

procedure TForm3.StringGrid2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 i,j, d:integer;
begin
  d:=0;
  for i:=StringGrid1.Selection.Left to StringGrid1.Selection.Right do begin
    for j:=StringGrid1.Selection.Top to StringGrid1.Selection.Bottom do begin

      if d = 0 then begin
        d:=d+1;
        s.x:=i;
        s.y:=j;
      end;

    end;
  end;
  Net.sendShotLocation(s.x, s.y);
  //отсылаем координаты выстрела
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

end.
