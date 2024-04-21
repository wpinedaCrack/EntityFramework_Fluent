IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240316013225_iniciarSincronizacion')
BEGIN
    CREATE TABLE [notas] (
        [idnota] int NOT NULL IDENTITY,
        [titulo] nvarchar(50) NULL,
        [descripcion] nvarchar(200) NULL,
        [fecha] date NOT NULL,
        [usuario_id] int NULL,
        CONSTRAINT [PK_notas] PRIMARY KEY ([idnota])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240316013225_iniciarSincronizacion')
BEGIN
    CREATE TABLE [usuario] (
        [id] int NOT NULL IDENTITY,
        [email] nvarchar(50) NULL,
        [nombre] nvarchar(200) NULL,
        [telefono] nvarchar(30) NULL,
        [password] varchar(100) NULL,
        [es_admin] int NULL,
        CONSTRAINT [PK_usuario] PRIMARY KEY ([id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240316013225_iniciarSincronizacion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240316013225_iniciarSincronizacion', N'6.0.0');
END;
GO

COMMIT;
GO

