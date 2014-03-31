unit Basis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Map, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  s, k:TCoord;
  Map:TMap;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var i, j:integer;
begin
  Map:=TMap.Create;
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
    Cells[1, 0]:='�';
    Cells[2, 0]:='�';
    Cells[3, 0]:='�';
    Cells[4, 0]:='�';
    Cells[5, 0]:='�';
    Cells[6, 0]:='�';
    Cells[7, 0]:='�';
    Cells[8, 0]:='�';
    Cells[9, 0]:='�';
    Cells[10, 0]:='�';
  end;
  for i:=1 to 10 do begin
    for j:=1 to 10 do begin
      s.x:=i;
      s.y:=j;
      StringGrid1.Cells[i, j]:=inttostr(Map.Draw(s));
    end;
  end;
end;

procedure TForm1.StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i, j, d : integer;
    b:Boolean;
begin
  d:=0;
  for i:=StringGrid1.Selection.Left to StringGrid1.Selection.Right do begin
    for j:=StringGrid1.Selection.Top to StringGrid1.Selection.Bottom do begin
//      ShowMessage('Col '+IntToStr(i)+' Row: '+IntToStr(j)+'  value = '+StringGrid1.Cells[i,j]);

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

  b:=Map.PlaceShip(s, k);

  if b then begin

    for i:=1 to 10 do begin
      for j:=1 to 10 do begin
        s.x:=i;
        s.y:=j;
        StringGrid1.Cells[i, j]:=inttostr(Map.Draw(s));
      end;
    end;

  end else begin
    ShowMessage('������');
    for i:=1 to 10 do begin
      for j:=1 to 10 do begin
        s.x:=i;
        s.y:=j;
        StringGrid1.Cells[i, j]:=inttostr(Map.Draw(s));
      end;
    end;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var i, j:integer;
begin
  Map.Create;
  for i:=1 to 10 do begin
      for j:=1 to 10 do begin
        s.x:=i;
        s.y:=j;
        StringGrid1.Cells[i, j]:=inttostr(Map.Draw(s));
      end;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Map.Free;
end;

end.