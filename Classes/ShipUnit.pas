unit ShipUnit;

interface

type
  ShipDeck = record
    X, Y: byte;
    Status : Boolean;
   end;

  TShip = class
  private
    Health, DecksCount : byte;
    DecksArray : array of ShipDeck;
  public
    constructor Create;
    destructor Destroy; override;
    function getHealth() : byte;
    function getDecksCount() : byte;
    function getDeck(Number: byte) : ShipDeck;
    procedure setDeckStatus(Number: byte; status : Boolean);
    procedure setDecksCount(Count: byte);
    procedure setDeckLocation(Number, X, y : byte);
   end;

implementation

{ TShip }

constructor TShip.Create;
begin
  DecksArray := nil;
end;

destructor TShip.Destroy;
begin

end;

function TShip.getDeck(Number: byte): ShipDeck;
begin
  Result := DecksArray[Number];
end;

function TShip.getDecksCount: byte;
begin
  Result := DecksCount;
end;

function TShip.getHealth: byte;
var i, cnt : integer;
begin
  for i := 0 to DecksCount - 1 do
   begin
    if DecksArray[i].Status then
     begin
      inc(cnt);
     end;
   end;
  Health := cnt; 
  Result := Health;
end;

procedure TShip.setDecksCount(Count: byte);
begin
  DecksCount := Count;
  SetLength(DecksArray, DecksCount);
end;

procedure TShip.setDeckStatus(Number: byte; Status: Boolean);
begin
  DecksArray[Number].Status := Status;
end;

procedure TShip.setDeckLocation(Number, X, Y : byte);
begin
  DecksArray[Number].X := X;
  DecksArray[Number].Y := Y;
end;  

end.
