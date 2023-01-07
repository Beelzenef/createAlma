use liga;

drop table if exists stats;
create table stats
(
	idEquipo int default 0,
	victoriasLocales smallint default 0,
	victoriasVisitantes smallint default 0,
	victoriasTotales smallint default 0
);