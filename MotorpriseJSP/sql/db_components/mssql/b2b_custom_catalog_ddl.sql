


--  @version $Id: //product/B2BCommerce/version/10.0.3/templates/MotorpriseJSP/sql/b2b_custom_catalog_ddl.xml#2 $$Change: 651448 $

create table b2b_belt_sku (
	sku_id	varchar(40)	not null,
	length	varchar(254)	null,
	top_width	varchar(254)	null,
	angle	varchar(254)	null,
	notched	numeric(1,0)	null
,constraint b2b_belt_sku_p primary key (sku_id)
,constraint b2b_beltsksku_d_f foreign key (sku_id) references dcs_sku (sku_id))


create table b2b_hose_sku (
	sku_id	varchar(40)	not null,
	inner_diameter	varchar(254)	null,
	length	varchar(254)	null
,constraint b2b_hose_sku_p primary key (sku_id)
,constraint b2b_hossksku_d_f foreign key (sku_id) references dcs_sku (sku_id))


create table b2b_sprkplg_sku (
	sku_id	varchar(40)	not null,
	plug_number	varchar(254)	null,
	thread	varchar(254)	null
,constraint b2b_sprkplg_sku_p primary key (sku_id)
,constraint b2b_sprksku_d_f foreign key (sku_id) references dcs_sku (sku_id))


create table b2b_oilfltr_sku (
	sku_id	varchar(40)	not null,
	thread_type	varchar(254)	null,
	length	varchar(254)	null,
	outer_diameter	varchar(254)	null
,constraint b2b_oilfltr_sku_p primary key (sku_id)
,constraint b2b_olflsku_d_f foreign key (sku_id) references dcs_sku (sku_id))


create table b2b_cylinder_sku (
	sku_id	varchar(40)	not null,
	diameter	varchar(254)	null,
	height	varchar(254)	null
,constraint b2b_cylinder_sku_p primary key (sku_id)
,constraint b2b_cylisku_d_f foreign key (sku_id) references dcs_sku (sku_id))


create table b2b_cube_sku (
	sku_id	varchar(40)	not null,
	height	varchar(254)	null,
	width	varchar(254)	null,
	depth	varchar(254)	null
,constraint b2b_cube_sku_p primary key (sku_id)
,constraint b2b_cubsksku_d_f foreign key (sku_id) references dcs_sku (sku_id))



go