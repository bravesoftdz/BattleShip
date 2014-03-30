unit PartyUnit;

interface

uses ShipUnit;

type
  TPlayer = record
    Name : string;
    status : boolean;
    LiveShipCount : byte;
    Address : string;
  end;

  Tarr = array[1..2, 1..10] of TShip;

  TParty = class
  private
    Oponent1, Oponent2 : TPlayer;
    ShipsArray : Tarr;
  public
    constructor Create;
    destructor Destroy; override;
    function getWhoStep : String;
    function getShipsArray : Tarr;
    procedure setWhoStep(Number : byte);
    procedure setNextStep;
    procedure setPlayerParameters(Number: byte; Name, Address : string);
    function getPlayerParameters(Number: byte) : TPlayer;
  end;  

implementation
  
function TParty.getWhoStep : String;
begin
  if Oponent1.status then Result := Oponent1.Name;
  if Oponent2.status then Result := Oponent2.Name;
end;

procedure TParty.setWhoStep(Number : byte);
begin
  if Number = 1 then Oponent1.status := true;
  if Number = 2 then Oponent2.status := true;
end;

procedure TParty.setNextStep;
begin
  Oponent1.status := not Oponent1.status;
  Oponent2.status := not Oponent2.status;
end;

function TParty.getShipsArray : Tarr;
begin
  Result := ShipsArray;
end;

constructor TParty.Create;
begin
  Oponent1.status := true;
  Oponent2.status := false;  
end;

destructor TParty.Destroy;
begin

  inherited;
end;

function TParty.getPlayerParameters(Number: byte): TPlayer;
begin
  if Number = 1 then
    Result := Oponent1;
  if Number = 2 then
    Result := Oponent2;
end;

procedure TParty.setPlayerParameters(Number: byte; Name, Address: string);
begin
  if Number = 1 then
    begin
      Oponent1.Name := Name;
      Oponent1.Address := Address;
    end;
  if Number = 2 then
    begin
      Oponent2.Name := Name;
      Oponent2.Address := Address;
    end;
end;

end.
