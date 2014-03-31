unit Map;

interface
Type
  TCoord = record
   x : integer;
   y : integer;
  end;


  TMap = class
   private
    pole:array[0..11, 0..11]of integer;
    Cship:array[1..4, 0..1]of integer;
    function PlaceCheck(pos1 : TCoord; pos2 : TCoord):Boolean;
    procedure PlaceDead(pos1 : TCoord; pos2 : TCoord);
   public
    constructor Create;
    destructor Destroy; override;
    function PlaceShip(pos1 : TCoord; pos2 : TCoord):Boolean;
    procedure PlaceMiss(pos: TCoord);
    function Draw(pos : TCoord):integer;
    procedure PlaceHit(pos : TCoord);
    function CountShips(pos, pos1 : TCoord):Boolean;
  End;


implementation

//5 - корабль
//3 - промах
//4 - попал
//2 - нельзя поставить

constructor TMap.Create;
var i, j:integer;
begin
  for i:=1 to 10 do begin
    for j:=1 to 10 do begin
      pole[i,j]:=0;
    end;
  end;

  for i:=1 to 4 do begin
    for j:=0 to 1 do begin
      Cship[i,j]:=0;
    end;
  end;
end;

destructor TMap.Destroy;
begin

  inherited;
end;

procedure TMap.PlaceMiss(pos : TCoord);
begin
  pole[pos.x, pos.y]:=3;
end;

function TMap.Draw(pos : TCoord):integer;
begin
  Result:=pole[pos.x, pos.y];
end;

procedure TMap.PlaceHit(pos: TCoord);
begin
  pole[pos.x, pos.y]:=4;
end;

function TMap.PlaceShip(pos1, pos2: TCoord):Boolean;
var diff:integer;
begin
{Осуществляет проверки, после чего зносит корабль(в виде цифры 5)
в массив pole}

  Result:=PlaceCheck(pos1,pos2);
  if Result then
    Result:=CountShips(pos1, pos2);

  if Result then begin

  PlaceDead(pos1, pos2);
  pole[pos1.x, pos1.y]:=5;
  pole[pos2.x, pos2.y]:=5;
  if pos1.x = pos2.x then begin
    diff:=pos1.y-pos2.y;
    case diff of
      -3:begin
           pole[pos1.x, pos1.y+1]:=5;
           pole[pos1.x, pos1.y+2]:=5;
         end;
      -2:begin
           pole[pos1.x, pos1.y+1]:=5;
         end;
       2:begin
           pole[pos1.x, pos1.y-1]:=5;
         end;
       3:begin
           pole[pos1.x, pos1.y-1]:=5;
           pole[pos1.x, pos1.y-2]:=5;
         end;
    end;
  end else begin
    diff:=pos1.x-pos2.x;
    case diff of
      -3:begin
           pole[pos1.x+1, pos1.y]:=5;
           pole[pos1.x+2, pos1.y]:=5;
         end;
      -2:begin
           pole[pos1.x+1, pos1.y]:=5;
         end;
       2:begin
           pole[pos1.x-1, pos1.y]:=5;
         end;
       3:begin
           pole[pos1.x-1, pos1.y]:=5;
           pole[pos1.x-2, pos1.y]:=5;
         end;
    end;
  end;
  end;

end;


function TMap.PlaceCheck(pos1, pos2: TCoord):Boolean;
var d:integer;
begin

{Совершает проверку
можно ли поставить корабль или нет
т.е. не занята ли клеточка каким-либо числом}

  Result:=true;
  if pos1.x = pos2.x then begin
    if pos1.y < pos2.y then begin
      d:=pos2.y-pos1.y;
      if d < 4 then begin
        while pos1.y < pos2.y+1 do begin
          if pole[pos1.x, pos1.y] <> 0 then begin
            Result:=false;
          end;
          pos1.y:=pos1.y+1;
        end;
      end else begin
        Result:=false;
      end;

    end else begin

      d:=pos1.y-pos2.y;
      if d < 4 then begin
        while pos1.y > pos2.y-1 do begin
          if pole[pos1.x, pos1.y] <> 0 then begin
            Result:=false;
          end;
          pos1.y:=pos1.y-1;
        end;
      end else begin
        Result:=false;
      end;

    end;
  end else begin
    if pos1.x < pos2.x then begin

      d:=pos2.x-pos1.x;
      if d < 4 then begin
        while pos1.x < pos2.x+1 do begin
          if pole[pos1.x, pos1.y] > 0 then begin
            Result:=false;
          end;
          pos1.x:=pos1.x+1;
        end;
      end else begin
        Result:=false;
      end;

    end else begin

      d:=pos1.x-pos2.x;
      if d < 4 then begin
        while pos1.x > pos2.x-1 do begin
          if pole[pos1.x, pos1.y] <> 0 then begin
            Result:=false;
          end;
          pos1.x:=pos1.x-1;
        end;
      end else begin
        Result:=false;
      end;

    end;
  end;
  if pos1.x <> pos2.x then begin
    if pos1.y <> pos2.y then begin
      Result:=false;
    end;
  end;
end;

procedure TMap.PlaceDead(pos1 : TCoord; pos2 : TCoord);
var a, b:integer;
n:boolean;
begin
{Расставляет зоны, куда нельзя ставить корабли
и обозначает их двойками}

  n:=true;
  if pos1.x = pos2.x then begin
    if pos1.y = pos2.y then begin
      n:=false;
      pole[pos1.x, pos1.y-1]:=2;
      pole[pos1.x, pos1.y+1]:=2;
      pole[pos1.x+1, pos1.y+1]:=2;
      pole[pos1.x-1, pos1.y+1]:=2;
      pole[pos1.x+1, pos1.y-1]:=2;
      pole[pos1.x-1, pos2.y-1]:=2;
      pole[pos1.x+1, pos1.y]:=2;
      pole[pos1.x-1, pos2.y]:=2;

    end;
      {pos1.y
      .
      .
      pos2.y}
    if n then begin
      if pos1.y < pos2.y then begin
        pole[pos1.x, pos1.y-1]:=2;
        pole[pos1.x, pos2.y+1]:=2;
        a:=pos1.x-1;
        b:=pos1.y-1;
        while b <> pos2.y+2 do begin
          pole[a, b]:=2;
          b:=b+1;
        end;
        a:=pos1.x+1;
        b:=pos1.y-1;
        while b <> pos2.y+2 do begin
          pole[a, b]:=2;
          b:=b+1;
        end;

      end else begin
         {pos1.y
         .
         .
         pos2.y}
        pole[pos1.x, pos1.y+1]:=2;
        pole[pos1.x, pos2.y-1]:=2;
        a:=pos1.x-1;
        b:=pos1.y+1;
        while b <> pos2.y-2 do begin
          pole[a, b]:=2;
          b:=b-1;
        end;
        a:=pos1.x+1;
        b:=pos1.y-1;
        while b <> pos2.y-2 do begin
          pole[a, b]:=2;
          b:=b-1;
        end;

      end;
    end;
  end else begin
    //pos1.x  ..  pos2.x
    if pos1.x < pos2.x then begin
      pole[pos1.x-1, pos1.y]:=2;
      pole[pos2.x+1, pos2.y]:=2;
      a:=pos1.x-1;
      b:=pos1.y-1;
      while a <> pos2.x+2 do begin
        pole[a, b]:=2;
        a:=a+1;
      end;
      a:=pos1.x-1;
      b:=pos1.y+1;
      while a <> pos2.x+2 do begin
        pole[a, b]:=2;
        a:=a+1;
      end;

    end else begin
    //pos2.x  ..  pos1.x
      pole[pos1.x+1, pos1.y+1]:=2;
      pole[pos1.x-1, pos2.y-1]:=2;
      a:=pos1.x+1;
      b:=pos1.y-1;
      while a <> pos2.x-2 do begin
        pole[a, b]:=2;
        a:=a-1;
      end;
      a:=pos1.x+1;
      b:=pos1.y+1;
      while b <> pos2.x-2 do begin
        pole[a, b]:=2;
        a:=a-1;
      end;

    end;
  end;
end;

function TMap.CountShips(pos, pos1: TCoord): Boolean;
var d:integer;
begin
{Этот метод проверяет колличество кораблей}

  Result:=True;

  if pos.x = pos1.x then begin

    if pos.y = pos1.y then begin
      if Cship[1, 1] = 5 then
        Result:=False;
        Cship[1, 0]:=Cship[1, 0]+1;
      if Cship[1, 0] = 4 then
        Cship[1, 1]:=5;
    end else begin

      if pos.y > pos1.y then begin
        d:=pos.y-pos1.y+1;
      if Cship[d, 1] = 5 then
        Result:=False;
        Cship[d, 0]:=Cship[d, 0]+1;
      if Cship[d, 0] = 5-d then
        Cship[d, 1]:=5;
      end else begin

        d:=pos1.y-pos.y+1;
      if Cship[d, 1] = 5 then
        Result:=False;
        Cship[d, 0]:=Cship[d, 0]+1;
      if Cship[d, 0] = 5-d then
        Cship[d, 1]:=5;
      end;
    end;

  end else begin

    if pos.x > pos1.x then begin
      d:=pos.x-pos1.x+1;
      if Cship[d, 1] = 5 then
        Result:=False;
        Cship[d, 0]:=Cship[d, 0]+1;
      if Cship[d, 0] = 5-d then
        Cship[d, 1]:=5;
    end else begin
      d:=pos1.x-pos.x+1;
      if Cship[d, 1] = 5 then
        Result:=False;
        Cship[d, 0]:=Cship[d, 0]+1;
      if Cship[d, 0] = 5-d then
        Cship[d, 1]:=5;
    end;
  end;
end;

end.

