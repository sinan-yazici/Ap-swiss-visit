USE [DB_gesAMM]
GO
/****** Object:  Table [dbo].[DECISION]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DECISION](
	[DCS_ID] [int] NOT NULL,
	[DCS_LIBELLE] [nvarchar](15) NOT NULL,
 CONSTRAINT [pk1] PRIMARY KEY CLUSTERED 
(
	[DCS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ETAPE]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETAPE](
	[ETP_NUM] [int] NOT NULL,
	[ETP_LIBELLE] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk2] PRIMARY KEY CLUSTERED 
(
	[ETP_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ETAPE_NORMEE]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETAPE_NORMEE](
	[ETP_NUM] [int] NOT NULL,
	[ETP_NORME] [nvarchar](20) NOT NULL,
	[ETP_DATE_NORME] [date] NULL,
 CONSTRAINT [pk3] PRIMARY KEY CLUSTERED 
(
	[ETP_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAMILLE]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAMILLE](
	[FAM_CODE] [nvarchar](3) NOT NULL,
	[FAM_LIBELLE] [nvarchar](80) NULL,
 CONSTRAINT [pk6] PRIMARY KEY CLUSTERED 
(
	[FAM_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HISTORIQUE]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HISTORIQUE](
	[HST_ID] [int] IDENTITY(1,1) NOT NULL,
	[HST_DATEMA] [datetime] NULL,
	[HST_ETP_NUM] [varchar](50) NULL,
	[HST_ETP_NORME_AVANT] [varchar](50) NULL,
	[HST_ETP_DATE_AVANT] [date] NULL,
	[HST_NORME_APRES] [varchar](50) NULL,
	[HST_ETP_DATE_APRES] [date] NULL,
 CONSTRAINT [pk10] PRIMARY KEY CLUSTERED 
(
	[HST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEDICAMENT]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEDICAMENT](
	[MED_DEPOTLEGAL] [nvarchar](10) NOT NULL,
	[MED_NOMCOMMERCIAL] [nvarchar](25) NULL,
	[FAM_CODE] [nvarchar](3) NOT NULL,
	[MED_COMPOSITION] [nvarchar](255) NULL,
	[MED_EFFETS] [nvarchar](255) NULL,
	[MED_CONTREINDIC] [nvarchar](255) NULL,
	[MED_PRIXECHANTILLON] [real] NULL,
	[Derniere_etape] [int] NULL,
 CONSTRAINT [pk4] PRIMARY KEY CLUSTERED 
(
	[MED_DEPOTLEGAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBIR]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBIR](
	[MED_DEPOTLEGAL] [nvarchar](10) NOT NULL,
	[ETP_NUM] [int] NOT NULL,
	[DCS_ID] [int] NULL,
	[dateDecision] [date] NOT NULL,
 CONSTRAINT [pk5] PRIMARY KEY CLUSTERED 
(
	[MED_DEPOTLEGAL] ASC,
	[ETP_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DECISION] ([DCS_ID], [DCS_LIBELLE]) VALUES (1, N'Accepter')
INSERT [dbo].[DECISION] ([DCS_ID], [DCS_LIBELLE]) VALUES (2, N'Refuser')
GO
INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (1, N'Définition du protocole de validation')
INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (2, N'Pharmacologie expérimentale')
INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (3, N'Toxicologie')
INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (4, N'Pharmacocinétique')
INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (5, N'Expérimentation animale')
INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (6, N'Méthodes alternatives')
INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (7, N'Essais cliniques')
INSERT [dbo].[ETAPE] ([ETP_NUM], [ETP_LIBELLE]) VALUES (8, N'Essais cliniques')
GO
INSERT [dbo].[ETAPE_NORMEE] ([ETP_NUM], [ETP_NORME], [ETP_DATE_NORME]) VALUES (3, N'444/2006/CEA        ', CAST(N'2007-08-05' AS Date))
INSERT [dbo].[ETAPE_NORMEE] ([ETP_NUM], [ETP_NORME], [ETP_DATE_NORME]) VALUES (5, N'245/2004/CEE        ', CAST(N'2006-08-05' AS Date))
INSERT [dbo].[ETAPE_NORMEE] ([ETP_NUM], [ETP_NORME], [ETP_DATE_NORME]) VALUES (7, N'457/2008/CEE', CAST(N'2008-03-15' AS Date))
INSERT [dbo].[ETAPE_NORMEE] ([ETP_NUM], [ETP_NORME], [ETP_DATE_NORME]) VALUES (8, N'665/2005/CEE', CAST(N'2005-04-30' AS Date))
GO
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'AA', N'Antalgiques en association')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'AAA', N'Antalgiques antipyrétiques en association')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'AAC', N'Antidépresseur d''action centrale')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'AAH', N'Antivertigineux antihistaminique H1')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'ABA', N'Antibiotique antituberculeux')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'ABC', N'Antibiotique antiacnéique local')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'ABP', N'Antibiotique de la famille des béta-lactamines (pénicilline A)')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'AFC', N'Antibiotique de la famille des cyclines')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'AFM', N'Antibiotique de la famille des macrolides')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'AH', N'Antihistaminique H1 local')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'AIM', N'Antidépresseur imipraminique (tricyclique)')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'AIN', N'Antidépresseur inhibiteur sélectif de la recapture de la sérotonine')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'ALO', N'Antibiotique local (ORL)')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'ANS', N'Antidépresseur IMAO non sélectif')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'AO', N'Antibiotique ophtalmique')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'AP', N'Antipsychotique normothymique')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'AUM', N'Antibiotique urinaire minute')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'CRT', N'Corticoïde, antibiotique et antifongique à  usage local')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'HYP', N'Hypnotique antihistaminique')
INSERT [dbo].[FAMILLE] ([FAM_CODE], [FAM_LIBELLE]) VALUES (N'PSA', N'Psychostimulant, antiasthénique')
GO
SET IDENTITY_INSERT [dbo].[HISTORIQUE] ON 

INSERT [dbo].[HISTORIQUE] ([HST_ID], [HST_DATEMA], [HST_ETP_NUM], [HST_ETP_NORME_AVANT], [HST_ETP_DATE_AVANT], [HST_NORME_APRES], [HST_ETP_DATE_APRES]) VALUES (29, CAST(N'2021-12-10T15:07:00.220' AS DateTime), N'3', N'assss               ', CAST(N'2007-08-05' AS Date), N'abdd                ', CAST(N'2007-08-05' AS Date))
INSERT [dbo].[HISTORIQUE] ([HST_ID], [HST_DATEMA], [HST_ETP_NUM], [HST_ETP_NORME_AVANT], [HST_ETP_DATE_AVANT], [HST_NORME_APRES], [HST_ETP_DATE_APRES]) VALUES (30, CAST(N'2021-12-10T16:52:41.627' AS DateTime), N'3', N'abdd                ', CAST(N'2007-08-05' AS Date), N'444/2006/CEE        ', CAST(N'2007-08-05' AS Date))
INSERT [dbo].[HISTORIQUE] ([HST_ID], [HST_DATEMA], [HST_ETP_NUM], [HST_ETP_NORME_AVANT], [HST_ETP_DATE_AVANT], [HST_NORME_APRES], [HST_ETP_DATE_APRES]) VALUES (31, CAST(N'2021-12-10T16:52:57.017' AS DateTime), N'5', N'abc                 ', CAST(N'2007-08-05' AS Date), N'245/2004/CEE        ', CAST(N'2007-08-05' AS Date))
INSERT [dbo].[HISTORIQUE] ([HST_ID], [HST_DATEMA], [HST_ETP_NUM], [HST_ETP_NORME_AVANT], [HST_ETP_DATE_AVANT], [HST_NORME_APRES], [HST_ETP_DATE_APRES]) VALUES (32, CAST(N'2021-12-10T16:55:06.500' AS DateTime), N'5', N'245/2004/CEE        ', CAST(N'2007-08-05' AS Date), N'245/2004/CEE        ', CAST(N'2006-08-05' AS Date))
INSERT [dbo].[HISTORIQUE] ([HST_ID], [HST_DATEMA], [HST_ETP_NUM], [HST_ETP_NORME_AVANT], [HST_ETP_DATE_AVANT], [HST_NORME_APRES], [HST_ETP_DATE_APRES]) VALUES (33, CAST(N'2021-12-13T08:47:26.263' AS DateTime), N'3', N'444/2006/CEE        ', CAST(N'2007-08-05' AS Date), N'444/2006/CEA        ', CAST(N'2007-08-05' AS Date))
INSERT [dbo].[HISTORIQUE] ([HST_ID], [HST_DATEMA], [HST_ETP_NUM], [HST_ETP_NORME_AVANT], [HST_ETP_DATE_AVANT], [HST_NORME_APRES], [HST_ETP_DATE_APRES]) VALUES (34, CAST(N'2021-12-13T08:47:39.183' AS DateTime), N'3', N'444/2006/CEA        ', CAST(N'2007-08-05' AS Date), N'444/2006/CEE        ', CAST(N'2007-08-05' AS Date))
INSERT [dbo].[HISTORIQUE] ([HST_ID], [HST_DATEMA], [HST_ETP_NUM], [HST_ETP_NORME_AVANT], [HST_ETP_DATE_AVANT], [HST_NORME_APRES], [HST_ETP_DATE_APRES]) VALUES (35, CAST(N'2021-12-13T13:56:18.400' AS DateTime), N'3', N'444/2006/CEE        ', CAST(N'2007-08-05' AS Date), N'444/2006/CEA        ', CAST(N'2007-08-05' AS Date))
SET IDENTITY_INSERT [dbo].[HISTORIQUE] OFF
GO
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'3MYC7', N'TRIMYCINE', N'CRT', N'Triamcinolone (acétonide) + Néomycine + Nystatine', N'Ce médicament est un corticoïde à  activité forte ou très forte associé à  un antibiotique et un antifongique, utilisé en application locale dans certaines atteintes cutanées surinfectées.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, d''infections de la peau ou de parasitisme non traités, d''acné. Ne pas appliquer sur une plaie, ni sous un pansement occlusif.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'a         ', N'a                        ', N'AA ', N'a                                                                                                                                                                                                                                                              ', N'a                                                                                                                                                                                                                                                              ', N'a                                                                                                                                                                                                                                                              ', 10, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'ADIMOL9', N'ADIMOL', N'ABP', N'Amoxicilline + Acide clavulanique', N'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie aux pénicillines ou aux céphalosporines.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'AMOPIL7', N'AMOPIL', N'ABP', N'Amoxicilline', N'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie aux pénicillines. Il doit être administré avec prudence en cas d''allergie aux céphalosporines.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'AMOX45', N'AMOXAR', N'ABP', N'Amoxicilline', N'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', N'La prise de ce médicament peut rendre positifs les tests de dépistage du dopage.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'AMOXIG12', N'AMOXI Gé', N'ABP', N'Amoxicilline', N'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie aux pénicillines. Il doit être administré avec prudence en cas d''allergie aux céphalosporines.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'APATOUX22', N'APATOUX Vitamine C', N'ALO', N'Tyrothricine + Tétracaïne + Acide ascorbique (Vitamine C)', N'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, en cas de phénylcétonurie et chez l''enfant de moins de 6 ans.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'BACTIG10', N'BACTIGEL', N'ABC', N'Erythromycine', N'Ce médicament est utilisé en application locale pour traiter l''acné et les infections cutanées bactériennes associées.', N'Ce médicament est contre-indiqué en cas d''allergie aux antibiotiques de la famille des macrolides ou des lincosanides.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'BACTIV13', N'BACTIVIL', N'AFM', N'Erythromycine', N'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie aux macrolides (dont le chef de file est l''érythromycine).', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'BITALV', N'BIVALIC', N'AAA', N'Dextropropoxyphène + Paracétamol', N'Ce médicament est utilisé pour traiter les douleurs d''intensité modérée ou intense.', N'Ce médicament est contre-indiqué en cas d''allergie aux médicaments de cette famille, d''insuffisance hépatique ou d''insuffisance rénale.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'CARTION6', N'CARTION', N'AAA', N'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol', N'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', N'Ce médicament est contre-indiqué en cas de troubles de la coagulation (tendances aux hémorragies), d''ulcère gastroduodénal, maladies graves du foie.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'CLAZER6', N'CLAZER', N'AFM', N'Clarithromycine', N'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques. Il est également utilisé dans le traitement de l''ulcère gastro-duodénal, en association avec d''autres médicaments.', N'Ce médicament est contre-indiqué en cas d''allergie aux macrolides (dont le chef de file est l''érythromycine).', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'dd        ', N'dd                       ', N'AAH', N'jkhgfd                                                                                                                                                                                                                                                         ', N'dfsdfdsfs                                                                                                                                                                                                                                                      ', N'ffdsfs                                                                                                                                                                                                                                                         ', 45, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'DEPRIL9', N'DEPRAMIL', N'AIM', N'Clomipramine', N'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères, certaines douleurs rebelles, les troubles obsessionnels compulsifs et certaines énurésies chez l''enfant.', N'Ce médicament est contre-indiqué en cas de glaucome ou d''adénome de la prostate, d''infarctus récent, ou si vous avez reà§u un traitement par IMAO durant les 2 semaines précédentes ou en cas d''allergie aux antidépresseurs imipraminiques.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'dfdd      ', N'lilian                   ', N'ABC', N'gfgff                                                                                                                                                                                                                                                          ', N'gfgfg                                                                                                                                                                                                                                                          ', N'fgfgfg                                                                                                                                                                                                                                                         ', 15, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'DIMIRTAM6', N'DIMIRTAM', N'AAC', N'Mirtazapine', N'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères.', N'La prise de ce produit est contre-indiquée en cas de d''allergie à  l''un des constituants.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'DOLRIL7', N'DOLORIL', N'AAA', N'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol', N'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.', N'Ce médicament est contre-indiqué en cas d''allergie au paracétamol ou aux salicylates.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'DORNOM8', N'NORMADOR', N'HYP', N'Doxylamine', N'Ce médicament est utilisé pour traiter l''insomnie chez l''adulte.', N'Ce médicament est contre-indiqué en cas de glaucome, de certains troubles urinaires (rétention urinaire) et chez l''enfant de moins de 15 ans.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'dsds      ', N'dsdsds                   ', N'AAC', N'gfg                                                                                                                                                                                                                                                            ', N'gfgdfgfg                                                                                                                                                                                                                                                       ', N'fgd                                                                                                                                                                                                                                                            ', 777, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'dsqdsq    ', N'dsqds                    ', N'AA', N'gfdgfgfd                                                                                                                                                                                                                                                       ', N'gfdgfdgfd                                                                                                                                                                                                                                                      ', N'fgfgfd                                                                                                                                                                                                                                                         ', 144, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'EQUILARX6', N'EQUILAR', N'AAH', N'Méclozine', N'Ce médicament est utilisé pour traiter les vertiges et pour prévenir le mal des transports.', N'Ce médicament ne doit pas être utilisé en cas d''allergie au produit, en cas de glaucome ou de rétention urinaire.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'EVILR7', N'EVEILLOR', N'PSA', N'Adrafinil', N'Ce médicament est utilisé pour traiter les troubles de la vigilance et certains symptomes neurologiques chez le sujet agé.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'fdfs      ', N'lilianne                 ', N'AA ', N'ggfgfd                                                                                                                                                                                                                                                         ', N'fgdfg                                                                                                                                                                                                                                                          ', N'fgfd                                                                                                                                                                                                                                                           ', 4555, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'gfgf      ', N'yoyo                     ', N'AAA', N'ht                                                                                                                                                                                                                                                             ', N'yty                                                                                                                                                                                                                                                            ', N't                                                                                                                                                                                                                                                              ', 7.555511E+14, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'INSXT5', N'INSECTIL', N'AH', N'Diphénydramine', N'Ce médicament est utilisé en application locale sur les piqûres d''insecte et l''urticaire.', N'Ce médicament est contre-indiqué en cas d''allergie aux antihistaminiques.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'JOVAI8', N'JOVENIL', N'AFM', N'Josamycine', N'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie aux macrolides (dont le chef de file est l''érythromycine).', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'LIDOXY23', N'LIDOXYTRACINE', N'AFC', N'Oxytétracycline +Lidocaïne', N'Ce médicament est utilisé en injection intramusculaire pour traiter certaines infections spécifiques.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants. Il ne doit pas être associé aux rétinoïdes.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'LITHOR12', N'LITHORINE', N'AP', N'Lithium', N'Ce médicament est indiqué dans la prévention des psychoses maniaco-dépressives ou pour traiter les états maniaques.', N'Ce médicament ne doit pas être utilisé si vous êtes allergique au lithium. Avant de prendre ce traitement, signalez à  votre médecin traitant si vous souffrez d''insuffisance rénale, ou si vous avez un régime sans sel.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'PARMOL16', N'PARMOCODEINE', N'AA', N'Codéine + Paracétamol', N'Ce médicament est utilisé pour le traitement des douleurs lorsque des antalgiques simples ne sont pas assez efficaces.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, chez l''enfant de moins de 15 Kg, en cas d''insuffisance hépatique ou respiratoire, d''asthme, de phénylcétonurie et chez la femme qui allaite.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'PHYSOI8', N'PHYSICOR', N'PSA', N'Sulbutiamine', N'Ce médicament est utilisé pour traiter les baisses d''activité physique ou psychique, souvent dans un contexte de dépression.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'PIRIZ8', N'PIRIZAN', N'ABA', N'Pyrazinamide', N'Ce médicament est utilisé, en association à  d''autres antibiotiques, pour traiter la tuberculose.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants, d''insuffisance rénale ou hépatique, d''hyperuricémie ou de porphyrie.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'POMDI20', N'POMADINE', N'AO', N'Bacitracine', N'Ce médicament est utilisé pour traiter les infections oculaires de la surface de l''oeil.', N'Ce médicament est contre-indiqué en cas d''allergie aux antibiotiques appliqués localement.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'SASS455   ', N'Rabec                    ', N'AA ', N'Rien                                                                                                                                                                                                                                                           ', N'Lanque de boulot                                                                                                                                                                                                                                               ', N'aucune                                                                                                                                                                                                                                                         ', 69, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'TROXT21', N'TROXADET', N'AIN', N'Paroxétine', N'Ce médicament est utilisé pour traiter la dépression et les troubles obsessionnels compulsifs. Il peut également être utilisé en prévention des crises de panique avec ou sans agoraphobie.', N'Ce médicament est contre-indiqué en cas d''allergie au produit.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'TXISOL22', N'TOUXISOL Vitamine C', N'ALO', N'Tyrothricine + Acide ascorbique (Vitamine C)', N'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.', N'Ce médicament est contre-indiqué en cas d''allergie à  l''un des constituants et chez l''enfant de moins de 6 ans.', NULL, NULL)
INSERT [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL], [MED_NOMCOMMERCIAL], [FAM_CODE], [MED_COMPOSITION], [MED_EFFETS], [MED_CONTREINDIC], [MED_PRIXECHANTILLON], [Derniere_etape]) VALUES (N'URIEG6', N'URIREGUL', N'AUM', N'Fosfomycine trométamol', N'Ce médicament est utilisé pour traiter les infections urinaires simples chez la femme de moins de 65 ans.', N'La prise de ce médicament est contre-indiquée en cas d''allergie à  l''un des constituants et d''insuffisance rénale.', NULL, NULL)
GO
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'3MYC7', 1, 1, CAST(N'2021-12-08' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'3MYC7', 2, 1, CAST(N'2021-12-09' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'3MYC7', 3, 2, CAST(N'2004-02-02' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'ADIMOL9', 1, 1, CAST(N'2017-03-02' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'ADIMOL9', 2, 1, CAST(N'2017-03-03' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'ADIMOL9', 3, 1, CAST(N'2017-03-04' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'ADIMOL9', 4, 1, CAST(N'2017-03-05' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'ADIMOL9', 5, 1, CAST(N'2017-03-06' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'ADIMOL9', 6, 1, CAST(N'2017-03-07' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'ADIMOL9', 7, 1, CAST(N'2017-03-08' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'AMOPIL7', 1, 1, CAST(N'2019-06-15' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'AMOX45', 1, 1, CAST(N'2018-11-19' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'AMOXIG12', 1, 1, CAST(N'2011-06-03' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'AMOXIG12', 2, 1, CAST(N'2011-06-05' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'AMOXIG12', 3, 1, CAST(N'2011-06-09' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'AMOXIG12', 4, 1, CAST(N'2011-06-12' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'AMOXIG12', 5, 1, CAST(N'2011-06-16' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'APATOUX22', 1, 1, CAST(N'2020-12-15' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'APATOUX22', 2, 1, CAST(N'2020-12-17' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'APATOUX22', 3, 1, CAST(N'2020-12-23' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'BACTIG10', 1, 1, CAST(N'2016-11-06' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'BITALV', 1, 1, CAST(N'2006-07-14' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'BITALV', 2, 1, CAST(N'2006-07-16' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'BITALV', 3, 1, CAST(N'2006-07-19' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'BITALV', 4, 1, CAST(N'2006-07-23' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'CARTION6', 1, 1, CAST(N'2008-12-25' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'CARTION6', 2, 1, CAST(N'2008-12-26' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'CARTION6', 3, 1, CAST(N'2008-12-28' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DEPRIL9', 1, 1, CAST(N'2001-01-01' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DEPRIL9', 2, 1, CAST(N'2001-01-02' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DEPRIL9', 3, 1, CAST(N'2001-01-03' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DEPRIL9', 4, 1, CAST(N'2001-01-04' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DEPRIL9', 5, 1, CAST(N'2001-01-05' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DEPRIL9', 6, 1, CAST(N'2001-01-06' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DEPRIL9', 7, 1, CAST(N'2001-01-07' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DEPRIL9', 8, 1, CAST(N'2001-01-08' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DIMIRTAM6', 1, 1, CAST(N'2010-05-02' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DIMIRTAM6', 2, 1, CAST(N'2010-05-04' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DIMIRTAM6', 3, 1, CAST(N'2010-05-07' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DOLRIL7', 1, 1, CAST(N'2012-07-10' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DORNOM8', 1, 1, CAST(N'2017-10-03' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DORNOM8', 2, 1, CAST(N'2017-10-08' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DORNOM8', 3, 1, CAST(N'2017-10-09' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'DORNOM8', 4, 1, CAST(N'2017-10-12' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'EQUILARX6', 1, 1, CAST(N'2020-06-02' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'EQUILARX6', 2, 1, CAST(N'2020-06-05' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'EQUILARX6', 3, 1, CAST(N'2020-06-09' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'EQUILARX6', 4, 1, CAST(N'2020-07-02' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'INSXT5', 1, 1, CAST(N'2014-12-02' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'INSXT5', 2, 1, CAST(N'2014-12-05' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'INSXT5', 3, 1, CAST(N'2014-12-07' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'INSXT5', 4, 1, CAST(N'2014-12-09' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'INSXT5', 5, 1, CAST(N'2014-12-13' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'INSXT5', 6, 1, CAST(N'2014-12-16' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'INSXT5', 7, 1, CAST(N'2014-12-23' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'JOVAI8', 1, 1, CAST(N'2015-09-05' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'JOVAI8', 2, 1, CAST(N'2015-09-08' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'JOVAI8', 3, 1, CAST(N'2015-09-15' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'JOVAI8', 4, 1, CAST(N'2015-09-25' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'LIDOXY23', 1, 1, CAST(N'2015-08-12' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'LITHOR12', 1, 1, CAST(N'2013-09-12' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'LITHOR12', 2, 1, CAST(N'2013-09-15' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'LITHOR12', 3, 1, CAST(N'2013-09-17' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'LITHOR12', 4, 1, CAST(N'2013-09-22' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'PARMOL16', 1, 1, CAST(N'2012-05-03' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'PARMOL16', 2, 1, CAST(N'2012-06-01' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'PHYSOI8', 1, 1, CAST(N'2015-08-03' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'PHYSOI8', 2, 1, CAST(N'2015-08-05' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'PHYSOI8', 3, 1, CAST(N'2015-08-08' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'POMDI20', 1, 1, CAST(N'2014-06-01' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'POMDI20', 2, 1, CAST(N'2014-06-04' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'POMDI20', 3, 1, CAST(N'2014-06-06' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'POMDI20', 4, 1, CAST(N'2014-06-09' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'POMDI20', 5, 1, CAST(N'2014-07-02' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'TROXT21', 1, 1, CAST(N'2013-08-02' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'TROXT21', 2, 1, CAST(N'2013-08-04' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'TROXT21', 3, 1, CAST(N'2013-08-09' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'TXISOL22', 1, 1, CAST(N'2019-02-06' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'TXISOL22', 2, 1, CAST(N'2019-02-08' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'TXISOL22', 3, 1, CAST(N'2019-02-14' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'TXISOL22', 4, 1, CAST(N'2019-02-18' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'TXISOL22', 5, 1, CAST(N'2019-02-24' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'TXISOL22', 6, 1, CAST(N'2019-02-27' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'URIEG6', 1, 1, CAST(N'2020-05-12' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'URIEG6', 2, 1, CAST(N'2020-05-15' AS Date))
INSERT [dbo].[SUBIR] ([MED_DEPOTLEGAL], [ETP_NUM], [DCS_ID], [dateDecision]) VALUES (N'URIEG6', 3, 1, CAST(N'2020-06-02' AS Date))
GO
ALTER TABLE [dbo].[ETAPE_NORMEE]  WITH CHECK ADD  CONSTRAINT [fk1] FOREIGN KEY([ETP_NUM])
REFERENCES [dbo].[ETAPE] ([ETP_NUM])
GO
ALTER TABLE [dbo].[ETAPE_NORMEE] CHECK CONSTRAINT [fk1]
GO
ALTER TABLE [dbo].[MEDICAMENT]  WITH CHECK ADD  CONSTRAINT [fk7] FOREIGN KEY([FAM_CODE])
REFERENCES [dbo].[FAMILLE] ([FAM_CODE])
GO
ALTER TABLE [dbo].[MEDICAMENT] CHECK CONSTRAINT [fk7]
GO
ALTER TABLE [dbo].[MEDICAMENT]  WITH CHECK ADD  CONSTRAINT [fk8] FOREIGN KEY([Derniere_etape])
REFERENCES [dbo].[ETAPE] ([ETP_NUM])
GO
ALTER TABLE [dbo].[MEDICAMENT] CHECK CONSTRAINT [fk8]
GO
ALTER TABLE [dbo].[SUBIR]  WITH CHECK ADD  CONSTRAINT [fk2] FOREIGN KEY([MED_DEPOTLEGAL])
REFERENCES [dbo].[MEDICAMENT] ([MED_DEPOTLEGAL])
GO
ALTER TABLE [dbo].[SUBIR] CHECK CONSTRAINT [fk2]
GO
ALTER TABLE [dbo].[SUBIR]  WITH CHECK ADD  CONSTRAINT [fk3] FOREIGN KEY([DCS_ID])
REFERENCES [dbo].[DECISION] ([DCS_ID])
GO
ALTER TABLE [dbo].[SUBIR] CHECK CONSTRAINT [fk3]
GO
ALTER TABLE [dbo].[SUBIR]  WITH CHECK ADD  CONSTRAINT [fk4] FOREIGN KEY([ETP_NUM])
REFERENCES [dbo].[ETAPE] ([ETP_NUM])
GO
ALTER TABLE [dbo].[SUBIR] CHECK CONSTRAINT [fk4]
GO
/****** Object:  StoredProcedure [dbo].[prc_afficher_decision]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_afficher_decision]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM DECISION
END
GO
/****** Object:  StoredProcedure [dbo].[prc_afficher_workflow]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_afficher_workflow](@depotLegal nvarchar(10))
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM subir
	WHERE MED_DEPOTLEGAL = @depotLegal
END
GO
/****** Object:  StoredProcedure [dbo].[prc_ajouter_medicament]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prc_ajouter_medicament]
	-- Add the parameters for the stored procedure here
	@DepotLegal nchar(10),
	@NomCommercial nchar(25),
	@FamilleCode nchar(3),
	@Composition nchar(255),
	@Effet nchar(255),
	@ContreIndication nchar(255),
	@PrixUnitaire float

AS
BEGIN
	SET NOCOUNT ON;
	
    -- Insertion du medicament
	INSERT INTO MEDICAMENT (MED_DEPOTLEGAL, MED_NOMCOMMERCIAL, FAM_CODE, MED_COMPOSITION, MED_EFFETS, MED_CONTREINDIC, MED_PRIXECHANTILLON) VALUES (@DepotLegal, @NomCommercial, @FamilleCode, @Composition, @Effet, @ContreIndication, @PrixUnitaire)
END
GO
/****** Object:  StoredProcedure [dbo].[prc_get_decision]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[prc_get_decision]

AS
BEGIN

	SET NOCOUNT ON;

	SELECT * from DECISION
END
GO
/****** Object:  StoredProcedure [dbo].[prc_get_etape]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_get_etape]
	-- Add the parameters for the stored procedure here

AS
BEGIN

	SET NOCOUNT ON;

	SELECT ETAPE.ETP_NUM, ETP_LIBELLE, ETP_NORME, ETP_DATE_NORME
	from ETAPE_NORMEE
	inner join ETAPE on ETAPE_NORMEE.ETP_NUM = ETAPE.ETP_NUM
	Order by ETAPE.ETP_NUM
END
GO
/****** Object:  StoredProcedure [dbo].[prc_get_familles]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[prc_get_familles]
AS
BEGIN

	SET NOCOUNT ON;
	select * from FAMILLE
END
GO
/****** Object:  StoredProcedure [dbo].[prc_get_medicament]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_get_medicament] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from MEDICAMENT
END
GO
/****** Object:  StoredProcedure [dbo].[prc_get_workflow]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_get_workflow](@depotLegal varchar(10))
AS
BEGIN

	SET NOCOUNT ON;

	SELECT * from SUBIR WHERE MED_DEPOTLEGAL = @depotLegal
END
GO
/****** Object:  StoredProcedure [dbo].[prc_lire_Etapes]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[prc_lire_Etapes]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT ETAPE.ETP_NUM, ETP_LIBELLE, ETP_NORME, ETP_DATE_NORME
	FROM ETAPE_NORMEE
	INNER JOIN ETAPE on ETAPE_NORMEE.ETP_NUM = ETAPE.ETP_NUM
	ORDER BY ETAPE.ETP_NUM
END
GO
/****** Object:  StoredProcedure [dbo].[prc_lireMedicament]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_lireMedicament]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM MEDICAMENT
END
GO
/****** Object:  StoredProcedure [dbo].[prc_liste_historique]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_liste_historique]


AS
BEGIN
	

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from HISTORIQUE
END
GO
/****** Object:  StoredProcedure [dbo].[prc_listeEtapeNormee]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_listeEtapeNormee]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from ETAPE_NORMEE N
	inner join ETAPE E on E.ETP_NUM = N.ETP_NUM
END
GO
/****** Object:  StoredProcedure [dbo].[prc_medicament_famille]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_medicament_famille](@fam_code varchar(50))
	AS
BEGIN
	
	SET NOCOUNT ON;

    select * from MEDICAMENT where FAM_CODE = @fam_code
END
GO
/****** Object:  StoredProcedure [dbo].[prc_select_med_fam]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_select_med_fam]
	
AS
BEGIN
	
	SET NOCOUNT ON;

   select *
   from FAMILLE
   
END
GO
/****** Object:  StoredProcedure [dbo].[prc_update_etape_normee]    Script Date: 13/12/2021 16:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prc_update_etape_normee](@etp_num int, @etp_norme varchar(50), @etp_date datetime)
-- Add the parameters for the stored procedure here

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;



-- Insert statements for procedure here
UPDATE ETAPE_NORMEE
set ETP_NORME = @etp_norme, ETP_DATE_NORME = @etp_date
where ETP_NUM = @etp_num
END
GO
