USE [bd_16_byciclon]
GO
/****** Object:  Table [dbo].[tb_cliente]    Script Date: 10/07/2025 17:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cliente](
	[idcliente] [int] IDENTITY(1,1) NOT NULL,
	[idendereco] [int] NOT NULL,
	[idregional] [int] NOT NULL,
	[nome] [varchar](40) NOT NULL,
	[email] [varchar](40) NOT NULL,
	[cpf] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_enderecos]    Script Date: 10/07/2025 17:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_enderecos](
	[idendereco] [int] IDENTITY(1,1) NOT NULL,
	[pais] [varchar](50) NULL,
	[uf] [varchar](50) NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[bairro] [varchar](50) NOT NULL,
	[rua] [varchar](50) NOT NULL,
	[numero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idendereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_itenspedidos]    Script Date: 10/07/2025 17:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_itenspedidos](
	[iditempedido] [int] IDENTITY(1,1) NOT NULL,
	[idpedido] [int] NOT NULL,
	[idproduto] [int] NOT NULL,
	[quantidade] [int] NOT NULL,
	[precounitario] [money] NOT NULL,
	[desconto] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[iditempedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_pedidos]    Script Date: 10/07/2025 17:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_pedidos](
	[idpedido] [int] IDENTITY(1,1) NOT NULL,
	[idcliente] [int] NOT NULL,
	[idvendedor] [int] NOT NULL,
	[datapedido] [date] NOT NULL,
	[qtditens] [int] NULL,
	[valortotal] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idpedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_produtos]    Script Date: 10/07/2025 17:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_produtos](
	[idproduto] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NOT NULL,
	[linha] [varchar](255) NULL,
	[valorunitario] [money] NOT NULL,
	[estoque] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idproduto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_regional]    Script Date: 10/07/2025 17:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_regional](
	[idregional] [int] IDENTITY(1,1) NOT NULL,
	[nomeregional] [varchar](50) NOT NULL,
	[enderecoregional] [varchar](255) NULL,
	[telefoneregional] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idregional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_vendedores]    Script Date: 10/07/2025 17:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_vendedores](
	[idvendedor] [int] IDENTITY(1,1) NOT NULL,
	[idendereco] [int] NOT NULL,
	[idregional] [int] NOT NULL,
	[nome] [varchar](40) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[cpf] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idvendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_produtos] ADD  DEFAULT ((0)) FOR [estoque]
GO
ALTER TABLE [dbo].[tb_cliente]  WITH CHECK ADD  CONSTRAINT [fk_cliente_endereco] FOREIGN KEY([idendereco])
REFERENCES [dbo].[tb_enderecos] ([idendereco])
GO
ALTER TABLE [dbo].[tb_cliente] CHECK CONSTRAINT [fk_cliente_endereco]
GO
ALTER TABLE [dbo].[tb_cliente]  WITH CHECK ADD  CONSTRAINT [fk_cliente_regional] FOREIGN KEY([idregional])
REFERENCES [dbo].[tb_regional] ([idregional])
GO
ALTER TABLE [dbo].[tb_cliente] CHECK CONSTRAINT [fk_cliente_regional]
GO
ALTER TABLE [dbo].[tb_itenspedidos]  WITH CHECK ADD  CONSTRAINT [fk_itenspedidos_produto] FOREIGN KEY([idproduto])
REFERENCES [dbo].[tb_produtos] ([idproduto])
GO
ALTER TABLE [dbo].[tb_itenspedidos] CHECK CONSTRAINT [fk_itenspedidos_produto]
GO
ALTER TABLE [dbo].[tb_pedidos]  WITH CHECK ADD  CONSTRAINT [fk_pedidos_vendedores] FOREIGN KEY([idvendedor])
REFERENCES [dbo].[tb_vendedores] ([idvendedor])
GO
ALTER TABLE [dbo].[tb_pedidos] CHECK CONSTRAINT [fk_pedidos_vendedores]
GO
ALTER TABLE [dbo].[tb_pedidos]  WITH CHECK ADD  CONSTRAINT [FK_tb_pedidos_tb_cliente] FOREIGN KEY([idcliente])
REFERENCES [dbo].[tb_cliente] ([idcliente])
GO
ALTER TABLE [dbo].[tb_pedidos] CHECK CONSTRAINT [FK_tb_pedidos_tb_cliente]
GO
ALTER TABLE [dbo].[tb_vendedores]  WITH CHECK ADD  CONSTRAINT [fk_vendedores_endereco] FOREIGN KEY([idendereco])
REFERENCES [dbo].[tb_enderecos] ([idendereco])
GO
ALTER TABLE [dbo].[tb_vendedores] CHECK CONSTRAINT [fk_vendedores_endereco]
GO
ALTER TABLE [dbo].[tb_vendedores]  WITH CHECK ADD  CONSTRAINT [fk_vendedores_regionais] FOREIGN KEY([idregional])
REFERENCES [dbo].[tb_regional] ([idregional])
GO
ALTER TABLE [dbo].[tb_vendedores] CHECK CONSTRAINT [fk_vendedores_regionais]
GO
