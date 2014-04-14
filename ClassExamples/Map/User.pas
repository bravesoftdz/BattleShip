unit User;

interface


type
  TUser = class
    private
      name:string;   // переменная имени пользывателя\огроничение длины имени
      MyXod:Boolean;     // состояние хода данного пользователя
       //True - ход пользователя
       //False - ход противника
      MyShips:Byte;      // кол-во короблей пользователя
     public
       constructor Create;
       destructor Destroy; override;
       //
       procedure EntName(name_:string);    // ввод имени пользователя
       function WriteName:string; // вывод имени пользователя
       //
       procedure EntXod(Xod:Boolean);  // изменение состояния хода пользователя
       function WriteXod:Boolean; //вывод состояния хода пользователя
       //
       procedure EntShips(KolvoShips:byte); // изменение количества кораблей
       function WriteShips:byte; //вывод текущего кол-во кораблей пользывателя
  end;

implementation

{ TUser }

constructor TUser.Create;
begin

end;

destructor TUser.Destroy;
begin

  inherited;
end;

procedure TUser.EntName(name_: string);
begin
 name:=name_;
end;

procedure TUser.EntShips(KolvoShips: byte);
begin
  MyShips:=KolvoShips;
end;

procedure TUser.EntXod(Xod: Boolean);
begin
  MyXod:=Xod;
end;

function TUser.WriteName: string;
begin
  Result:=name;
end;

function TUser.WriteShips: byte;
begin
  Result:=MyShips;
end;

function TUser.WriteXod: Boolean;
begin
  Result:=MyXod;
end;

end.
