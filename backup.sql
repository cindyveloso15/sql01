--- fazendo o backup do banco (ajustar o local se necessario)
--- C:\Users\integral\Desktop\SQL _Cindy\BACKUPS

BACKUP DATABASE bd_16_byciclon
to DISK = 'C:\Users\integral\Desktop\SQL _Cindy\BACKUPS\bd_16_byciclon_10_07_25.BAK'
WITH FORMAT,
	MEDIANAME = 'bd_16_byciclon_backup',
	NAME = 'Full Backup do BD Byciclon'

--restaurar o backup feito anteriormente
RESTORE DATABASE bd_16_byciclon
FROM DISK = 'C:\Users\integral\Desktop\SQL _Cindy\BACKUPS\bd_16_byciclon_10_07_25.BAK'
WITH REPLACE


