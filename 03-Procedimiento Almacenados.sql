create procedure sp_ObtenerAccesoPorRol
@idRol smallint
as
begin
	select	a.*
	from	Rol r
			inner join AccesoRol ar on ar.idRol = r.IdRol
			inner join Acceso a on a.idAcceso = ar.idAcceso
	where	r.IdRol = @idRol and a.habilitado = 1
	order by a.posicion asc
end
go
create procedure sp_ObtenerAccesosNoAsociados
@idRol smallint
as
begin
	select	a.*
	from	Acceso a
	where	a.habilitado = 1
			and a.idAcceso not in (
			select	a.idAcceso
			from	Acceso a
					inner join AccesoRol ar on a.idAcceso = ar.idAcceso
			where	ar.idRol = @idRol
			)
end