-- Selecciona a los players que aparecieron en 2021 jugando para Astros
SELECT DISTINCT 
        people.nameFirst, 
        people.nameLast, 
        teams.name AS 'team', 
        appearances.yearID
    FROM people
	    JOIN appearances
	        ON people.playerID = appearances.playerID
	    JOIN teams
	        ON teams.teamID = appearances.teamID
	WHERE appearances.yearID = 2021 AND teams.name = 'Houston Astros'
	ORDER BY people.nameLast

-- Return batting statistics from the 2000 season in MLB


-- Return batting statistics from the 1950 season in MLB


-- Return batting statistics from the 1927 season in MLB for team Murderer's Row" New York Yankees


-- Return batting statistics from the 1927 season in MLB 
--		for team Murderer's Row" New York Yankees
--		but ignore stats with any at bats


-- Batting average (H/AB) in Cincinnati Reds in 1975

-- Slugging (H+2B+2*3B+3*HR)/AB

-- On-base percentage (H+BB+HBP)/(AB+BB+HBP+SF) AS OBP

-- Muestra la información de jugadores (team, nombre, año) junto a los siguientes datos
--	G, AB, H, 2B, 3B, HR, R, RBI, SB, OBP, SLG y BA (formato clasico de baseball card) de Reds en 1975

-- Baseball card para Johnny Bench en 1975 para los Reds

-- OPS = OBP + SLG

-- RC (Runs Created) = (H+BB) * TB/(AB+BB) - Creada por Bill James

SELECT 
	proc_materials_1.name AS caja,
	dbo.proc_pos.name AS cargoname, 
	dbo.proc_materials.extcode, 
	dbo.proc_pos.description1 AS colorcargo, 
	base_companies_1.description1 AS colorharbour, 
	dbo.proc_pos.firstday AS firstday, 
	dbo.proc_packs.prday AS prday, 
	format(dbo.proc_packs.regtime, ''HH:mm:ss'') AS hora, 
	'' '' AS inventario, 
	dbo.proc_packs.nregs AS n_registros,
	ROUND(dbo.proc_packs.weight, 2) AS weight,
	dbo.proc_packs.pieces AS pieces,
	dbo.proc_materials.name AS producto,
	dbo.proc_packs.origin AS puerta,
	dbo.proc_packs.number AS number,
	dbo.base_companies.extcode AS supplier,
	dbo.proc_materials.fabcode1 AS fabcode1,
	dbo.proc_materials.active, proc_materials_2.description8 AS especie, 
	proc_materials.shname AS shname
		FROM dbo.proc_packs WITH (NOLOCK) 
			INNER JOIN dbo.proc_materials ON dbo.proc_packs.material = dbo.proc_materials.material
			INNER JOIN dbo.proc_materials AS proc_materials_1 ON dbo.proc_materials.pkpackaging = proc_materials_1.material
			INNER JOIN dbo.proc_materials AS proc_materials_2 ON dbo.proc_materials.base = proc_materials_2.material
			INNER JOIN dbo.proc_pos ON dbo.proc_packs.po = dbo.proc_pos.po 
			INNER JOIN dbo.base_companies ON dbo.proc_pos.supplier = dbo.base_companies.company
			INNER JOIN dbo.base_companies AS base_companies_1 ON dbo.proc_pos.entryport = base_companies_1.company
		WHERE dbo.proc_packs.rtype = 1 
			AND proc_packs.weight > 0 
			AND proc_packs.material = proc_materials.material 
			AND proc_pos.supplier = base_companies.company
			AND proc_packs.number > @FiltroLote 
		ORDER BY proc_packs.number