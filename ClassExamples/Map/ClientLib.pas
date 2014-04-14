Type

	  TSArr = array[1..40] of Byte;

  MessageBuf = record
  	cmdIndex : byte;
  end;

  ShipLocationsBuf = record
  	cmdIndex : byte;
  	ShipsArray : TSArr;
  end;

  ShotLoactionBuf = record
    cmdIndex : byte;
    X, Y : byte;
  end;

  ReadBuf = array[1..41] of byte;

//---------------------------------------------------//

procedure TNet.sendShotLocation(X, Y : byte);           //выстрел
var Buf : ShotLoactionBuf;
begin
  Buf.cmdIndex := 5;
  Buf.X := X;
  Buf.Y := Y;
  Form1.ClientSocket1.Socket.sendBuf(Buf, sizeof(Buf));
end;

procedure TNet.sendStartGame;                           //начало
var Buf : MessageBuf;
begin
  Buf.cmdIndex := 3;
  Form1.ClientSocket1.Socket.sendBuf(Buf, sizeof(Buf));
end;

procedure TNet.sendShipLocations(ShipsArray : TSArr);   //корабли
var Buf : ShipLocationsBuf;
begin
	Buf.cmdIndex := 2;
	Buf.ShipsArray := ShipsArray;
	Form1.ClientSocket1.Socket.sendBuf(Buf, sizeof(Buf));
end;

