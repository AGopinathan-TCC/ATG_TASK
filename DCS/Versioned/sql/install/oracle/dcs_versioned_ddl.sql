
-- the source for this section is 
-- commerce_user.sql





create table dps_credit_card (
	id	varchar2(40)	not null,
	credit_card_number	varchar2(40)	null,
	credit_card_type	varchar2(40)	null,
	expiration_month	varchar2(20)	null,
	exp_day_of_month	varchar2(20)	null,
	expiration_year	varchar2(20)	null,
	billing_addr	varchar2(40)	null
,constraint dps_credit_card_p primary key (id));

create index dps_crcdba_idx on dps_credit_card (billing_addr);

create table dcs_user (
	user_id	varchar2(40)	not null,
	allow_partial_ship	number(1,0)	null,
	default_creditcard	varchar2(40)	null,
	daytime_phone_num	varchar2(30)	null,
	express_checkout	number(1,0)	null,
	default_carrier	varchar2(256)	null,
	price_list	varchar2(40)	null,
	sale_price_list	varchar2(40)	null
,constraint dcs_user_p primary key (user_id)
,constraint dcs_usrdeflt_cr_f foreign key (default_creditcard) references dps_credit_card (id)
,constraint dcs_user1_c check (allow_partial_ship in (0,1))
,constraint dcs_user2_c check (express_checkout in (0,1)));

create index dcs_usrdcc_idx on dcs_user (default_creditcard);

create table dps_usr_creditcard (
	user_id	varchar2(40)	not null,
	tag	varchar2(42)	not null,
	credit_card_id	varchar2(40)	not null
,constraint dps_usr_creditca_p primary key (user_id,tag)
,constraint dps_usrccredt_cr_f foreign key (credit_card_id) references dps_credit_card (id)
,constraint dps_usrcusr_d_f foreign key (user_id) references dps_user (id));

create index dps_ucccid_idx on dps_usr_creditcard (credit_card_id);
create index dps_uccuid_idx on dps_usr_creditcard (user_id);




-- the source for this section is 
-- versioned_product_catalog_ddl.sql





create table dcs_folder (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	folder_id	varchar2(40)	not null,
	version	integer	not null,
	creation_date	timestamp	null,
	start_date	timestamp	null,
	end_date	timestamp	null,
	description	varchar2(254)	null,
	name	varchar2(254)	not null,
	path	varchar2(254)	not null,
	parent_folder_id	varchar2(40)	null
,constraint dcs_folder_p primary key (folder_id,asset_version));

create index fldr_end_dte_idx on dcs_folder (end_date);
create index fldr_path_idx on dcs_folder (path);
create index fldr_strt_dte_idx on dcs_folder (start_date);
create index dcs_folder_wsx on dcs_folder (workspace_id);
create index dcs_folder_cix on dcs_folder (checkin_date);

create table dcs_media (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	media_id	varchar2(40)	not null,
	version	integer	not null,
	creation_date	timestamp	null,
	start_date	timestamp	null,
	end_date	timestamp	null,
	description	varchar2(254)	null,
	name	varchar2(254)	not null,
	path	varchar2(254)	not null,
	parent_folder_id	varchar2(40)	not null,
	media_type	integer	null
,constraint dcs_media_p primary key (media_id,asset_version));

create index med_end_dte_idx on dcs_media (end_date);
create index med_path_idx on dcs_media (path);
create index med_strt_dte_idx on dcs_media (start_date);
create index med_type_idx on dcs_media (media_type);
create index dcs_media_wsx on dcs_media (workspace_id);
create index dcs_media_cix on dcs_media (checkin_date);

create table dcs_media_ext (
	asset_version	number(19)	not null,
	media_id	varchar2(40)	not null,
	url	varchar2(254)	not null
,constraint dcs_media_ext_p primary key (media_id,asset_version));


create table dcs_media_bin (
	asset_version	number(19)	not null,
	media_id	varchar2(40)	not null,
	length	integer	not null,
	last_modified	timestamp	not null,
	data	blob	not null
,constraint dcs_media_bin_p primary key (media_id,asset_version));


create table dcs_media_txt (
	asset_version	number(19)	not null,
	media_id	varchar2(40)	not null,
	length	integer	not null,
	last_modified	timestamp	not null,
	data	clob	not null
,constraint dcs_media_txt_p primary key (media_id,asset_version));


create table dcs_category (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	category_id	varchar2(40)	not null,
	version	integer	not null,
	catalog_id	varchar2(40)	null,
	creation_date	timestamp	null,
	start_date	timestamp	null,
	end_date	timestamp	null,
	display_name	varchar2(254)	null,
	description	varchar2(254)	null,
	long_description	clob	null,
	parent_cat_id	varchar2(40)	null,
	category_type	integer	null,
	root_category	number(1,0)	null
,constraint dcs_category_p primary key (category_id,asset_version)
,constraint dcs_category_c check (root_category in (0,1)));

create index cat_end_dte_idx on dcs_category (end_date);
create index cat_pcatid_idx on dcs_category (parent_cat_id);
create index cat_strt_dte_idx on dcs_category (start_date);
create index cat_type_idx on dcs_category (category_type);
create index dcs_category_wsx on dcs_category (workspace_id);
create index dcs_category_cix on dcs_category (checkin_date);

create table dcs_category_acl (
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	item_acl	varchar2(1024)	null
,constraint dcs_category_acl_p primary key (category_id,asset_version));


create table dcs_product (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	product_id	varchar2(40)	not null,
	version	integer	not null,
	creation_date	timestamp	null,
	start_date	timestamp	null,
	end_date	timestamp	null,
	display_name	varchar2(254)	null,
	description	varchar2(254)	null,
	long_description	clob	null,
	parent_cat_id	varchar2(40)	null,
	product_type	integer	null,
	admin_display	varchar2(254)	null,
	nonreturnable	number(1,0)	null,
	brand	varchar2(254)	null,
	disallow_recommend	number(1,0)	null
,constraint dcs_product_p primary key (product_id,asset_version)
,constraint dcs_product_c check (nonreturnable in (0,1))
,constraint dcs_product1_c check (disallow_recommend in (0,1)));

create index prd_end_dte_idx on dcs_product (end_date);
create index prd_pcatid_idx on dcs_product (parent_cat_id);
create index prd_strt_dte_idx on dcs_product (start_date);
create index prd_type_idx on dcs_product (product_type);
create index dcs_product_wsx on dcs_product (workspace_id);
create index dcs_product_cix on dcs_product (checkin_date);

create table dcs_product_acl (
	asset_version	number(19)	not null,
	product_id	varchar2(40)	not null,
	item_acl	varchar2(1024)	null
,constraint dcs_product_acl_p primary key (product_id,asset_version));


create table dcs_sku (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	sku_id	varchar2(40)	not null,
	version	integer	not null,
	creation_date	timestamp	null,
	start_date	timestamp	null,
	end_date	timestamp	null,
	display_name	varchar2(254)	null,
	description	varchar2(254)	null,
	sku_type	integer	null,
	wholesale_price	number(19,7)	null,
	list_price	number(19,7)	null,
	sale_price	number(19,7)	null,
	on_sale	number(1,0)	null,
	tax_status	integer	null,
	fulfiller	integer	null,
	item_acl	varchar2(1024)	null,
	nonreturnable	number(1,0)	null
,constraint dcs_sku_p primary key (sku_id,asset_version)
,constraint dcs_sku_c check (on_sale in (0,1))
,constraint dcs_sku1_c check (nonreturnable in (0,1)));

create index sku_end_dte_idx on dcs_sku (end_date);
create index sku_lstprice_idx on dcs_sku (list_price);
create index sku_sleprice_idx on dcs_sku (sale_price);
create index sku_strt_dte_idx on dcs_sku (start_date);
create index sku_type_idx on dcs_sku (sku_type);
create index dcs_sku_wsx on dcs_sku (workspace_id);
create index dcs_sku_cix on dcs_sku (checkin_date);

create table dcs_cat_groups (
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	child_prd_group	varchar2(254)	null,
	child_cat_group	varchar2(254)	null,
	related_cat_group	varchar2(254)	null
,constraint dcs_cat_groups_p primary key (category_id,asset_version));


create table dcs_cat_chldprd (
	sec_asset_version	number(19)	not null,
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	child_prd_id	varchar2(40)	not null
,constraint dcs_cat_chldprd_p primary key (category_id,sequence_num,asset_version,sec_asset_version));

create index ct_chldprd_cpi_idx on dcs_cat_chldprd (child_prd_id);
create index ct_chldprd_cid_idx on dcs_cat_chldprd (category_id);

create table dcs_cat_chldcat (
	sec_asset_version	number(19)	not null,
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	child_cat_id	varchar2(40)	not null
,constraint dcs_cat_chldcat_p primary key (category_id,sequence_num,asset_version,sec_asset_version));

create index ct_chldcat_cci_idx on dcs_cat_chldcat (child_cat_id);
create index ct_chldcat_cid_idx on dcs_cat_chldcat (category_id);

create table dcs_cat_ancestors (
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	anc_cat_id	varchar2(40)	not null
,constraint dcs_cat_ancestor_p primary key (category_id,anc_cat_id,asset_version));

create index dcs_ct_anc_cat_id on dcs_cat_ancestors (anc_cat_id);
create index dcs_ct_cat_id on dcs_cat_ancestors (category_id);

create table dcs_cat_rltdcat (
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	related_cat_id	varchar2(40)	not null
,constraint dcs_cat_rltdcat_p primary key (category_id,sequence_num,asset_version));

create index ct_rltdcat_cid_idx on dcs_cat_rltdcat (category_id);

create table dcs_cat_keywrds (
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	keyword	varchar2(254)	not null
,constraint dcs_cat_keywrds_p primary key (category_id,sequence_num,asset_version));

create index cat_keywrds_idx on dcs_cat_keywrds (keyword);
create index ct_keywrds_cid_idx on dcs_cat_keywrds (category_id);

create table dcs_cat_media (
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	template_id	varchar2(40)	null,
	thumbnail_image_id	varchar2(40)	null,
	small_image_id	varchar2(40)	null,
	large_image_id	varchar2(40)	null
,constraint dcs_cat_media_p primary key (category_id,asset_version));


create table dcs_cat_aux_media (
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	tag	varchar2(42)	not null,
	media_id	varchar2(40)	not null
,constraint dcs_cat_aux_medi_p primary key (category_id,tag,asset_version));

create index ct_aux_mdia_ci_idx on dcs_cat_aux_media (category_id);

create table dcs_prd_keywrds (
	asset_version	number(19)	not null,
	product_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	keyword	varchar2(254)	not null
,constraint dcs_prd_keywrds_p primary key (product_id,sequence_num,asset_version));

create index prd_keywrds_idx on dcs_prd_keywrds (keyword);
create index pr_keywrds_pid_idx on dcs_prd_keywrds (product_id);

create table dcs_prd_media (
	asset_version	number(19)	not null,
	product_id	varchar2(40)	not null,
	template_id	varchar2(40)	null,
	thumbnail_image_id	varchar2(40)	null,
	small_image_id	varchar2(40)	null,
	large_image_id	varchar2(40)	null
,constraint dcs_prd_media_p primary key (product_id,asset_version));


create table dcs_prd_aux_media (
	asset_version	number(19)	not null,
	product_id	varchar2(40)	not null,
	tag	varchar2(42)	not null,
	media_id	varchar2(40)	not null
,constraint dcs_prd_aux_medi_p primary key (product_id,tag,asset_version));

create index pr_aux_mdia_pi_idx on dcs_prd_aux_media (product_id);

create table dcs_prd_chldsku (
	sec_asset_version	number(19)	not null,
	asset_version	number(19)	not null,
	product_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	sku_id	varchar2(40)	not null
,constraint dcs_prd_chldsku_p primary key (product_id,sequence_num,asset_version,sec_asset_version));

create index pr_chldsku_sid_idx on dcs_prd_chldsku (sku_id);
create index pr_chldsku_pid_idx on dcs_prd_chldsku (product_id);

create table dcs_prd_skuattr (
	asset_version	number(19)	not null,
	product_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	attribute_name	varchar2(40)	not null
,constraint dcs_prd_skuattr_p primary key (product_id,sequence_num,asset_version));

create index pr_skuattr_pid_idx on dcs_prd_skuattr (product_id);

create table dcs_prd_groups (
	asset_version	number(19)	not null,
	product_id	varchar2(40)	not null,
	related_prd_group	varchar2(254)	null,
	upsl_prd_group	varchar2(254)	null
,constraint dcs_prd_groups_p primary key (product_id,asset_version));


create table dcs_prd_rltdprd (
	asset_version	number(19)	not null,
	product_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	related_prd_id	varchar2(40)	not null
,constraint dcs_prd_rltdprd_p primary key (product_id,sequence_num,asset_version));

create index pr_rltdprd_pid_idx on dcs_prd_rltdprd (product_id);

create table dcs_prd_upslprd (
	asset_version	number(19)	not null,
	product_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	upsell_prd_id	varchar2(40)	not null
,constraint dcs_prd_upslprd_p primary key (product_id,sequence_num,asset_version));


create table dcs_prd_ancestors (
	asset_version	number(19)	not null,
	product_id	varchar2(40)	not null,
	anc_cat_id	varchar2(40)	not null
,constraint dcs_prd_ancestor_p primary key (product_id,anc_cat_id,asset_version));

create index dcs_prd_anc_cat_id on dcs_prd_ancestors (anc_cat_id);
create index dcs_prd_prd_id on dcs_prd_ancestors (product_id);

create table dcs_sku_attr (
	asset_version	number(19)	not null,
	sku_id	varchar2(40)	not null,
	attribute_name	varchar2(42)	not null,
	attribute_value	varchar2(254)	not null
,constraint dcs_sku_attr_p primary key (sku_id,attribute_name,asset_version));

create index sku_attr_skuid_idx on dcs_sku_attr (sku_id);

create table dcs_sku_link (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	sku_link_id	varchar2(40)	not null,
	version	integer	not null,
	creation_date	timestamp	null,
	start_date	timestamp	null,
	end_date	timestamp	null,
	display_name	varchar2(254)	null,
	description	varchar2(254)	null,
	quantity	integer	not null,
	bundle_item	varchar2(40)	not null,
	item_acl	varchar2(1024)	null
,constraint dcs_sku_link_p primary key (sku_link_id,asset_version));

create index skl_end_dte_idx on dcs_sku_link (end_date);
create index skl_strt_dte_idx on dcs_sku_link (start_date);
create index dcs_sku_link_wsx on dcs_sku_link (workspace_id);
create index dcs_sku_link_cix on dcs_sku_link (checkin_date);

create table dcs_sku_bndllnk (
	asset_version	number(19)	not null,
	sku_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	sku_link_id	varchar2(40)	not null
,constraint dcs_sku_bndllnk_p primary key (sku_id,sequence_num,asset_version));

create index sk_bndllnk_sid_idx on dcs_sku_bndllnk (sku_id);

create table dcs_sku_media (
	asset_version	number(19)	not null,
	sku_id	varchar2(40)	not null,
	template_id	varchar2(40)	null,
	thumbnail_image_id	varchar2(40)	null,
	small_image_id	varchar2(40)	null,
	large_image_id	varchar2(40)	null
,constraint dcs_sku_media_p primary key (sku_id,asset_version));


create table dcs_sku_aux_media (
	asset_version	number(19)	not null,
	sku_id	varchar2(40)	not null,
	tag	varchar2(42)	not null,
	media_id	varchar2(40)	not null
,constraint dcs_sku_aux_medi_p primary key (sku_id,tag,asset_version));

create index sk_aux_mdia_si_idx on dcs_sku_aux_media (sku_id);

create table dcs_sku_replace (
	asset_version	number(19)	not null,
	sku_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	replacement	varchar2(40)	not null
,constraint dcs_sku_replace_p primary key (sku_id,sequence_num,asset_version));

create index sk_replace_sid_idx on dcs_sku_replace (sku_id);

create table dcs_sku_conf (
	asset_version	number(19)	not null,
	sku_id	varchar2(40)	not null,
	config_props	varchar2(40)	not null,
	sequence_num	integer	not null
,constraint dcs_sku_conf_p primary key (sku_id,sequence_num,asset_version));


create table dcs_config_prop (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	config_prop_id	varchar2(40)	not null,
	version	integer	not null,
	display_name	varchar2(40)	null,
	description	varchar2(255)	null,
	item_acl	varchar2(1024)	null
,constraint dcs_config_prop_p primary key (config_prop_id,asset_version));

create index dcs_config_pro_wsx on dcs_config_prop (workspace_id);
create index dcs_config_pro_cix on dcs_config_prop (checkin_date);

create table dcs_conf_options (
	asset_version	number(19)	not null,
	config_prop_id	varchar2(40)	not null,
	config_options	varchar2(40)	not null,
	sequence_num	integer	not null
,constraint dcs_conf_options_p primary key (config_prop_id,sequence_num,asset_version));


create table dcs_config_opt (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	config_opt_id	varchar2(40)	not null,
	version	integer	not null,
	display_name	varchar2(40)	null,
	description	varchar2(255)	null,
	sku	varchar2(40)	null,
	product	varchar2(40)	null,
	price	number(19,7)	null,
	item_acl	varchar2(1024)	null
,constraint dcs_config_opt_p primary key (config_opt_id,asset_version));

create index ct_conf_prod_idx on dcs_config_opt (product);
create index ct_conf_sku_idx on dcs_config_opt (sku);
create index dcs_config_opt_wsx on dcs_config_opt (workspace_id);
create index dcs_config_opt_cix on dcs_config_opt (checkin_date);

create table dcs_foreign_cat (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	catalog_id	varchar2(40)	not null,
	type	integer	not null,
	version	integer	not null,
	name	varchar2(100)	null,
	description	varchar2(255)	null,
	host	varchar2(100)	null,
	port	integer	null,
	base_url	varchar2(255)	null,
	return_url	varchar2(255)	null,
	item_acl	varchar2(1024)	null
,constraint dcs_foreign_cat_p primary key (catalog_id,asset_version));

create index dcs_foreign_ca_wsx on dcs_foreign_cat (workspace_id);
create index dcs_foreign_ca_cix on dcs_foreign_cat (checkin_date);




-- the source for this section is 
-- inventory_ddl.sql





create table dcs_inventory (
	inventory_id	varchar2(40)	not null,
	version	integer	not null,
	inventory_lock	varchar2(20)	null,
	creation_date	timestamp	null,
	start_date	timestamp	null,
	end_date	timestamp	null,
	display_name	varchar2(254)	null,
	description	varchar2(254)	null,
	catalog_ref_id	varchar2(40)	not null,
	avail_status	integer	not null,
	availability_date	timestamp	null,
	stock_level	integer	null,
	backorder_level	integer	null,
	preorder_level	integer	null,
	stock_thresh	integer	null,
	backorder_thresh	integer	null,
	preorder_thresh	integer	null
,constraint dcs_inventory_p primary key (inventory_id)
,constraint inv_catrefid_idx unique (catalog_ref_id));

create index inv_end_dte_idx on dcs_inventory (end_date);
create index inv_strt_dte_idx on dcs_inventory (start_date);




-- the source for this section is 
-- versioned_promotion_ddl.sql




-- Add the DCS_PRM_FOLDER table, promotionFolder

create table dcs_prm_folder (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	folder_id	varchar2(40)	not null,
	name	varchar2(254)	not null,
	parent_folder	varchar2(40)	null
,constraint dcs_prm_folder_p primary key (folder_id,asset_version));

create index dcs_prm_folder_wsx on dcs_prm_folder (workspace_id);
create index dcs_prm_folder_cix on dcs_prm_folder (checkin_date);

create table dcs_promotion (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	promotion_id	varchar2(40)	not null,
	version	integer	not null,
	creation_date	timestamp	null,
	start_date	timestamp	null,
	end_date	timestamp	null,
	display_name	varchar2(254)	null,
	description	varchar2(254)	null,
	promotion_type	integer	null,
	enabled	number(1,0)	null,
	begin_usable	timestamp	null,
	end_usable	timestamp	null,
	priority	integer	null,
	global	number(1,0)	null,
	anon_profile	number(1,0)	null,
	allow_multiple	number(1,0)	null,
	uses	integer	null,
	rel_expiration	number(1,0)	null,
	time_until_expire	integer	null,
	template	varchar2(254)	null,
	ui_access_lvl	integer	null,
	parent_folder	varchar2(40)	null,
	last_modified	timestamp	null,
	pmdl_version	integer	null,
	qualifier	varchar2(254)	null
,constraint dcs_promotion_p primary key (promotion_id,asset_version)
,constraint dcs_promotion1_c check (enabled in (0,1))
,constraint dcs_promotion2_c check (global in (0,1))
,constraint dcs_promotion3_c check (anon_profile in (0,1))
,constraint dcs_promotion4_c check (allow_multiple in (0,1))
,constraint dcs_promotion5_c check (rel_expiration in (0,1)));

create index prmo_bgin_use_idx on dcs_promotion (begin_usable);
create index prmo_end_dte_idx on dcs_promotion (end_date);
create index prmo_end_use_idx on dcs_promotion (end_usable);
create index prmo_strt_dte_idx on dcs_promotion (start_date);
create index dcs_promotion_wsx on dcs_promotion (workspace_id);
create index dcs_promotion_cix on dcs_promotion (checkin_date);

create table dcs_promo_media (
	asset_version	number(19)	not null,
	promotion_id	varchar2(40)	not null,
	tag	varchar2(42)	not null,
	media_id	varchar2(40)	not null
,constraint dcs_promo_media_p primary key (promotion_id,tag,asset_version));

create index promo_mdia_pid_idx on dcs_promo_media (promotion_id);

create table dcs_discount_promo (
	asset_version	number(19)	not null,
	promotion_id	varchar2(40)	not null,
	calculator	varchar2(254)	null,
	adjuster	number(19,7)	null,
	pmdl_rule	clob	not null,
	one_use	number(1,0)	null
,constraint dcs_discount_pro_p primary key (promotion_id,asset_version)
,constraint dcs_discount_pro_c check (one_use in (0, 1)));


create table dcs_promo_upsell (
	asset_version	number(19)	not null,
	promotion_id	varchar2(40)	not null,
	upsell	number(1,0)	null
,constraint dcs_promo_upsell_p primary key (promotion_id,asset_version)
,constraint dcs_promo_upsell_c check (upsell in (0, 1)));


create table dcs_upsell_action (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	action_id	varchar2(40)	not null,
	version	number(10)	not null,
	name	varchar2(40)	not null,
	upsell_prd_grp	clob	null
,constraint dcs_upsell_actn_p primary key (action_id,asset_version));

create index dcs_upsell_act_wsx on dcs_upsell_action (workspace_id);
create index dcs_upsell_act_cix on dcs_upsell_action (checkin_date);

create table dcs_close_qualif (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	close_qualif_id	varchar2(40)	not null,
	version	number(10)	not null,
	name	varchar2(40)	not null,
	priority	number(10)	null,
	qualifier	clob	null,
	upsell_media	varchar2(40)	null,
	upsell_action	varchar2(40)	null
,constraint dcs_close_qualif_p primary key (close_qualif_id,asset_version));

create index dcs_close_qual_wsx on dcs_close_qualif (workspace_id);
create index dcs_close_qual_cix on dcs_close_qualif (checkin_date);

create table dcs_prm_cls_qlf (
	sec_asset_version	number(19)	not null,
	asset_version	number(19)	not null,
	promotion_id	varchar2(40)	not null,
	closeness_qualif	varchar2(40)	not null);


create table dcs_prm_sites (
	asset_version	number(19)	not null,
	promotion_id	varchar2(40)	not null,
	site_id	varchar2(40)	not null);


create table dcs_prm_site_grps (
	asset_version	number(19)	not null,
	promotion_id	varchar2(40)	not null,
	site_group_id	varchar2(40)	not null);


create table dcs_prm_tpl_vals (
	asset_version	number(19)	not null,
	promotion_id	varchar2(40)	not null,
	placeholder	varchar2(40)	not null,
	placeholderValue	clob	null
,constraint dcs_prm_tpl_vals_p primary key (promotion_id,placeholder,asset_version));


create table dcs_prm_cls_vals (
	asset_version	number(19)	not null,
	close_qualif_id	varchar2(40)	not null,
	placeholder	varchar2(40)	not null,
	placeholderValue	clob	null
,constraint dcs_prm_cls_vals_p primary key (close_qualif_id,placeholder,asset_version));


create table dcs_upsell_prods (
	asset_version	number(19)	not null,
	action_id	varchar2(40)	not null,
	product_id	varchar2(40)	not null,
	sequence_num	number(10)	not null
,constraint dcs_upsell_prods_p primary key (action_id,product_id,asset_version));





-- the source for this section is 
-- user_promotion_ddl.sql




-- The promotion line was commented out to allow the profile and promotion tables to be delinked. The promotion tables are intended to be used as a "read-only" table on the production servers. The promotion (and product catalog) tables are promoted and made active on the production system through copy-switch. In doing so, the profile tables and the promotion tables cannot be in the same database, and therefore we must remove this referece. However if you are not going to use copy-switch for the promotions, then you can add this reference back in.     promotion			VARCHAR(40)		NOT NULL	REFERENCES dcs_promotion(promotion_id),

create table dcs_usr_promostat (
	status_id	varchar2(40)	not null,
	profile_id	varchar2(40)	not null,
	promotion	varchar2(40)	not null,
	num_uses	integer	null,
	expirationDate	timestamp	null,
	granted_date	timestamp	null
,constraint dcs_usr_promosta_p primary key (status_id));

create index promostat_prof_idx on dcs_usr_promostat (profile_id);
create index usr_prmstat_pr_idx on dcs_usr_promostat (promotion);

create table dcs_usr_actvpromo (
	id	varchar2(40)	not null,
	sequence_num	integer	not null,
	promo_status_id	varchar2(40)	not null
,constraint dcs_usr_actvprom_p primary key (id,sequence_num));

create index usr_actvprm_id_idx on dcs_usr_actvpromo (id);
-- The promotion_id column was commented out to allow the profile and promotion tables to be delinked. The promotion tables are intended to be used as a "read-only" table on the production servers. The promotion (and product catalog) tables are promoted and made active on the production system through copy-switch. In doing so, the profile tables and the promotion tables cannot be in the same database, and therefore we must remove this referece. However if you are not going to use copy-switch for the promotions, then you can add this reference back in.        promotion_id                    VARCHAR(40)             NOT NULL        REFERENCES dcs_promotion(promotion_id),

create table dcs_usr_usedpromo (
	id	varchar2(40)	not null,
	promotion_id	varchar2(40)	not null
,constraint dcs_usr_usedprom_p primary key (id,promotion_id));

create index usr_usedprm_id_idx on dcs_usr_usedpromo (id);
create index usr_usedprm_pi_idx on dcs_usr_usedpromo (promotion_id);




-- the source for this section is 
-- user_giftlist_ddl.sql





create table dcs_giftlist (
	id	varchar2(40)	not null,
	owner_id	varchar2(40)	null,
	site_id	varchar2(40)	null,
	is_public	number(1,0)	not null,
	is_published	number(1,0)	not null,
	event_name	varchar2(64)	null,
	event_type	integer	null,
	event_date	timestamp	null,
	comments	varchar2(254)	null,
	description	varchar2(254)	null,
	instructions	varchar2(254)	null,
	creation_date	timestamp	null,
	last_modified_date	timestamp	null,
	shipping_addr_id	varchar2(40)	null
,constraint dcs_giftlist_p primary key (id)
,constraint dcs_giftlist1_c check (is_public in (0,1))
,constraint dcs_giftlist2_c check (is_published in (0,1)));

create index gftlst_shpadid_idx on dcs_giftlist (shipping_addr_id);
create index gft_evnt_name_idx on dcs_giftlist (event_name);
create index gft_evnt_type_idx on dcs_giftlist (event_type);
create index gft_owner_id_idx on dcs_giftlist (owner_id);
create index gft_site_id_idx on dcs_giftlist (site_id);

create table dcs_giftinst (
	giftlist_id	varchar2(40)	not null,
	tag	varchar2(42)	not null,
	special_inst	varchar2(254)	null
,constraint dcs_giftinst_p primary key (giftlist_id,tag)
,constraint dcs_giftgiftlst__f foreign key (giftlist_id) references dcs_giftlist (id));

create index giftinst_gflid_idx on dcs_giftinst (giftlist_id);

create table dcs_giftitem (
	id	varchar2(40)	not null,
	catalog_ref_id	varchar2(40)	null,
	product_id	varchar2(40)	null,
	site_id	varchar2(40)	null,
	display_name	varchar2(254)	null,
	description	varchar2(254)	null,
	quantity_desired	integer	null,
	quantity_purchased	integer	null
,constraint dcs_giftitem_p primary key (id));

create index giftitem_cat_idx on dcs_giftitem (catalog_ref_id);
create index giftitem_prod_idx on dcs_giftitem (product_id);
create index giftitem_site_idx on dcs_giftitem (site_id);

create table dcs_giftlist_item (
	giftlist_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	giftitem_id	varchar2(40)	null
,constraint dcs_giftlist_ite_p primary key (giftlist_id,sequence_num)
,constraint dcs_giftgifttm_d_f foreign key (giftitem_id) references dcs_giftitem (id)
,constraint dcs_gftlstgftlst_f foreign key (giftlist_id) references dcs_giftlist (id));

create index gftlst_itm_gii_idx on dcs_giftlist_item (giftitem_id);
create index gftlst_itm_gli_idx on dcs_giftlist_item (giftlist_id);

create table dcs_user_wishlist (
	user_id	varchar2(40)	not null,
	giftlist_id	varchar2(40)	null
,constraint dcs_user_wishlis_p primary key (user_id)
,constraint dcs_usrwgiftlst__f foreign key (giftlist_id) references dcs_giftlist (id));

create index usr_wshlst_gli_idx on dcs_user_wishlist (giftlist_id);

create table dcs_user_giftlist (
	user_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	giftlist_id	varchar2(40)	null
,constraint dcs_user_giftlis_p primary key (user_id,sequence_num));

create index usr_gftlst_uid_idx on dcs_user_giftlist (user_id);

create table dcs_user_otherlist (
	user_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	giftlist_id	varchar2(40)	null
,constraint dcs_user_otherli_p primary key (user_id,sequence_num)
,constraint dcs_usrtgiftlst__f foreign key (giftlist_id) references dcs_giftlist (id));

create index usr_otrlst_gli_idx on dcs_user_otherlist (giftlist_id);




-- the source for this section is 
-- order_ddl.sql





create table dcspp_order (
	order_id	varchar2(40)	not null,
	type	integer	not null,
	version	integer	not null,
	order_class_type	varchar2(40)	null,
	profile_id	varchar2(40)	null,
	description	varchar2(64)	null,
	state	varchar2(40)	null,
	state_detail	varchar2(254)	null,
	created_by_order	varchar2(40)	null,
	origin_of_order	number(10)	null,
	creation_date	timestamp	null,
	submitted_date	timestamp	null,
	last_modified_date	timestamp	null,
	completed_date	timestamp	null,
	price_info	varchar2(40)	null,
	tax_price_info	varchar2(40)	null,
	explicitly_saved	number(1,0)	null,
	agent_id	varchar2(40)	null,
	sales_channel	number(10)	null,
	creation_site_id	varchar2(40)	null,
	site_id	varchar2(40)	null
,constraint dcspp_order_p primary key (order_id)
,constraint dcspp_order_c check (explicitly_saved IN (0,1)));

create index order_lastmod_idx on dcspp_order (last_modified_date);
create index order_profile_idx on dcspp_order (profile_id);
create index order_submit_idx on dcspp_order (submitted_date);
create index ord_creat_site_idx on dcspp_order (creation_site_id);
create index ord_site_idx on dcspp_order (site_id);

create table dcspp_ship_group (
	shipping_group_id	varchar2(40)	not null,
	type	integer	not null,
	version	integer	not null,
	shipgrp_class_type	varchar2(40)	null,
	shipping_method	varchar2(40)	null,
	description	varchar2(64)	null,
	ship_on_date	timestamp	null,
	actual_ship_date	timestamp	null,
	state	varchar2(40)	null,
	state_detail	varchar2(254)	null,
	submitted_date	timestamp	null,
	price_info	varchar2(40)	null,
	order_ref	varchar2(40)	null
,constraint dcspp_ship_group_p primary key (shipping_group_id));


create table dcspp_pay_group (
	payment_group_id	varchar2(40)	not null,
	type	integer	not null,
	version	integer	not null,
	paygrp_class_type	varchar2(40)	null,
	payment_method	varchar2(40)	null,
	amount	number(19,7)	null,
	amount_authorized	number(19,7)	null,
	amount_debited	number(19,7)	null,
	amount_credited	number(19,7)	null,
	currency_code	varchar2(10)	null,
	state	varchar2(40)	null,
	state_detail	varchar2(254)	null,
	submitted_date	timestamp	null,
	order_ref	varchar2(40)	null
,constraint dcspp_pay_group_p primary key (payment_group_id));


create table dcspp_item (
	commerce_item_id	varchar2(40)	not null,
	type	integer	not null,
	version	integer	not null,
	item_class_type	varchar2(40)	null,
	catalog_id	varchar2(40)	null,
	catalog_ref_id	varchar2(40)	null,
	catalog_key	varchar2(40)	null,
	product_id	varchar2(40)	null,
	site_id	varchar2(40)	null,
	quantity	number(19,0)	null,
	state	varchar2(40)	null,
	state_detail	varchar2(254)	null,
	price_info	varchar2(40)	null,
	order_ref	varchar2(40)	null
,constraint dcspp_item_p primary key (commerce_item_id));

create index item_catref_idx on dcspp_item (catalog_ref_id);
create index item_prodref_idx on dcspp_item (product_id);
create index item_site_idx on dcspp_item (site_id);

create table dcspp_relationship (
	relationship_id	varchar2(40)	not null,
	type	integer	not null,
	version	integer	not null,
	rel_class_type	varchar2(40)	null,
	relationship_type	varchar2(40)	null,
	order_ref	varchar2(40)	null
,constraint dcspp_relationsh_p primary key (relationship_id));


create table dcspp_rel_orders (
	order_id	varchar2(40)	not null,
	related_orders	varchar2(40)	not null,
	sequence_num	integer	not null
,constraint dcspp_rel_orders_p primary key (order_id,sequence_num)
,constraint dcspp_reordr_d_f foreign key (order_id) references dcspp_order (order_id));


create table dcspp_order_inst (
	order_id	varchar2(40)	not null,
	tag	varchar2(42)	not null,
	special_inst	varchar2(254)	null
,constraint dcspp_order_inst_p primary key (order_id,tag)
,constraint dcspp_orordr_d_f foreign key (order_id) references dcspp_order (order_id));

create index order_inst_oid_idx on dcspp_order_inst (order_id);

create table dcspp_order_sg (
	order_id	varchar2(40)	not null,
	shipping_groups	varchar2(40)	not null,
	sequence_num	integer	not null
,constraint dcspp_order_sg_p primary key (order_id,sequence_num)
,constraint dcspp_sgordr_d_f foreign key (order_id) references dcspp_order (order_id));

create index order_sg_ordid_idx on dcspp_order_sg (order_id);

create table dcspp_order_pg (
	order_id	varchar2(40)	not null,
	payment_groups	varchar2(40)	not null,
	sequence_num	integer	not null
,constraint dcspp_order_pg_p primary key (order_id,sequence_num)
,constraint dcspp_orpgordr_f foreign key (order_id) references dcspp_order (order_id));

create index order_pg_ordid_idx on dcspp_order_pg (order_id);

create table dcspp_order_item (
	order_id	varchar2(40)	not null,
	commerce_items	varchar2(40)	not null,
	sequence_num	integer	not null
,constraint dcspp_order_item_p primary key (order_id,sequence_num)
,constraint dcspp_oritordr_d_f foreign key (order_id) references dcspp_order (order_id));

create index order_item_oid_idx on dcspp_order_item (order_id);
create index order_item_cit_idx on dcspp_order_item (commerce_items);

create table dcspp_order_rel (
	order_id	varchar2(40)	not null,
	relationships	varchar2(40)	not null,
	sequence_num	integer	not null
,constraint dcspp_order_rel_p primary key (order_id,sequence_num)
,constraint dcspp_orlordr_d_f foreign key (order_id) references dcspp_order (order_id));

create index order_rel_orid_idx on dcspp_order_rel (order_id);

create table dcspp_ship_inst (
	shipping_group_id	varchar2(40)	not null,
	tag	varchar2(42)	not null,
	special_inst	varchar2(254)	null
,constraint dcspp_ship_inst_p primary key (shipping_group_id,tag)
,constraint dcspp_shshippng__f foreign key (shipping_group_id) references dcspp_ship_group (shipping_group_id));

create index ship_inst_sgid_idx on dcspp_ship_inst (shipping_group_id);

create table dcspp_hrd_ship_grp (
	shipping_group_id	varchar2(40)	not null,
	tracking_number	varchar2(40)	null
,constraint dcspp_hrd_ship_g_p primary key (shipping_group_id)
,constraint dcspp_hrshippng__f foreign key (shipping_group_id) references dcspp_ship_group (shipping_group_id));


create table dcspp_ele_ship_grp (
	shipping_group_id	varchar2(40)	not null,
	email_address	varchar2(255)	null
,constraint dcspp_ele_ship_g_p primary key (shipping_group_id)
,constraint dcspp_elshippng__f foreign key (shipping_group_id) references dcspp_ship_group (shipping_group_id));


create table dcspp_ship_addr (
	shipping_group_id	varchar2(40)	not null,
	prefix	varchar2(40)	null,
	first_name	varchar2(40)	null,
	middle_name	varchar2(40)	null,
	last_name	varchar2(40)	null,
	suffix	varchar2(40)	null,
	job_title	varchar2(40)	null,
	company_name	varchar2(40)	null,
	address_1	varchar2(50)	null,
	address_2	varchar2(50)	null,
	address_3	varchar2(50)	null,
	city	varchar2(40)	null,
	county	varchar2(40)	null,
	state	varchar2(40)	null,
	postal_code	varchar2(10)	null,
	country	varchar2(40)	null,
	phone_number	varchar2(40)	null,
	fax_number	varchar2(40)	null,
	email	varchar2(255)	null
,constraint dcspp_ship_addr_p primary key (shipping_group_id)
,constraint dcspp_shdshippng_f foreign key (shipping_group_id) references dcspp_ship_group (shipping_group_id));


create table dcspp_hand_inst (
	handling_inst_id	varchar2(40)	not null,
	type	integer	not null,
	version	integer	not null,
	hndinst_class_type	varchar2(40)	null,
	handling_method	varchar2(40)	null,
	shipping_group_id	varchar2(40)	null,
	commerce_item_id	varchar2(40)	null,
	quantity	integer	null
,constraint dcspp_hand_inst_p primary key (handling_inst_id));

create index hi_item_idx on dcspp_hand_inst (commerce_item_id);
create index hi_ship_group_idx on dcspp_hand_inst (shipping_group_id);

create table dcspp_gift_inst (
	handling_inst_id	varchar2(40)	not null,
	giftlist_id	varchar2(40)	null,
	giftlist_item_id	varchar2(40)	null
,constraint dcspp_gift_inst_p primary key (handling_inst_id)
,constraint dcspp_gihandlng__f foreign key (handling_inst_id) references dcspp_hand_inst (handling_inst_id));


create table dcspp_sg_hand_inst (
	shipping_group_id	varchar2(40)	not null,
	handling_instrs	varchar2(40)	not null,
	sequence_num	integer	not null
,constraint dcspp_sg_hand_in_p primary key (shipping_group_id,sequence_num)
,constraint dcspp_sgshippng__f foreign key (shipping_group_id) references dcspp_ship_group (shipping_group_id));

create index sg_hnd_ins_sgi_idx on dcspp_sg_hand_inst (shipping_group_id);

create table dcspp_pay_inst (
	payment_group_id	varchar2(40)	not null,
	tag	varchar2(42)	not null,
	special_inst	varchar2(254)	null
,constraint dcspp_pay_inst_p primary key (payment_group_id,tag)
,constraint dcspp_papaymnt_g_f foreign key (payment_group_id) references dcspp_pay_group (payment_group_id));

create index pay_inst_pgrid_idx on dcspp_pay_inst (payment_group_id);

create table dcspp_config_item (
	config_item_id	varchar2(40)	not null,
	reconfig_data	varchar2(255)	null,
	notes	varchar2(255)	null
,constraint dcspp_config_ite_p primary key (config_item_id)
,constraint dcspp_coconfg_tm_f foreign key (config_item_id) references dcspp_item (commerce_item_id));


create table dcspp_subsku_item (
	subsku_item_id	varchar2(40)	not null,
	ind_quantity	integer	null
,constraint dcspp_subsku_ite_p primary key (subsku_item_id)
,constraint dcspp_susubsk_tm_f foreign key (subsku_item_id) references dcspp_item (commerce_item_id));


create table dcspp_item_ci (
	commerce_item_id	varchar2(40)	not null,
	commerce_items	varchar2(40)	not null,
	sequence_num	integer	not null
,constraint dcspp_item_ci_p primary key (commerce_item_id,sequence_num)
,constraint dcspp_itcommrc_t_f foreign key (commerce_item_id) references dcspp_item (commerce_item_id));


create table dcspp_gift_cert (
	payment_group_id	varchar2(40)	not null,
	profile_id	varchar2(40)	null,
	gift_cert_number	varchar2(50)	null
,constraint dcspp_gift_cert_p primary key (payment_group_id)
,constraint dcspp_gipaymnt_g_f foreign key (payment_group_id) references dcspp_pay_group (payment_group_id));

create index gc_number_idx on dcspp_gift_cert (gift_cert_number);
create index gc_profile_idx on dcspp_gift_cert (profile_id);

create table dcspp_store_cred (
	payment_group_id	varchar2(40)	not null,
	profile_id	varchar2(40)	null,
	store_cred_number	varchar2(50)	null
,constraint dcspp_store_cred_p primary key (payment_group_id)
,constraint dcspp_stpaymnt_g_f foreign key (payment_group_id) references dcspp_pay_group (payment_group_id));

create index sc_number_idx on dcspp_store_cred (store_cred_number);
create index sc_profile_idx on dcspp_store_cred (profile_id);

create table dcspp_credit_card (
	payment_group_id	varchar2(40)	not null,
	credit_card_number	varchar2(40)	null,
	credit_card_type	varchar2(40)	null,
	expiration_month	varchar2(20)	null,
	exp_day_of_month	varchar2(20)	null,
	expiration_year	varchar2(20)	null
,constraint dcspp_credit_car_p primary key (payment_group_id)
,constraint dcspp_crpaymnt_g_f foreign key (payment_group_id) references dcspp_pay_group (payment_group_id));


create table dcspp_bill_addr (
	payment_group_id	varchar2(40)	not null,
	prefix	varchar2(40)	null,
	first_name	varchar2(40)	null,
	middle_name	varchar2(40)	null,
	last_name	varchar2(40)	null,
	suffix	varchar2(40)	null,
	job_title	varchar2(40)	null,
	company_name	varchar2(40)	null,
	address_1	varchar2(50)	null,
	address_2	varchar2(50)	null,
	address_3	varchar2(50)	null,
	city	varchar2(40)	null,
	county	varchar2(40)	null,
	state	varchar2(40)	null,
	postal_code	varchar2(10)	null,
	country	varchar2(40)	null,
	phone_number	varchar2(40)	null,
	fax_number	varchar2(40)	null,
	email	varchar2(255)	null
,constraint dcspp_bill_addr_p primary key (payment_group_id)
,constraint dcspp_bipaymnt_g_f foreign key (payment_group_id) references dcspp_pay_group (payment_group_id));


create table dcspp_pay_status (
	status_id	varchar2(40)	not null,
	type	integer	not null,
	version	integer	not null,
	trans_id	varchar2(50)	null,
	amount	number(19,7)	null,
	trans_success	number(1,0)	null,
	error_message	varchar2(254)	null,
	trans_timestamp	timestamp	null
,constraint dcspp_pay_status_p primary key (status_id)
,constraint dcspp_pay_status_c check (trans_success IN (0,1)));


create table dcspp_cc_status (
	status_id	varchar2(40)	not null,
	auth_expiration	timestamp	null,
	avs_code	varchar2(40)	null,
	avs_desc_result	varchar2(254)	null,
	integration_data	varchar2(256)	null
,constraint dcspp_cc_status_p primary key (status_id)
,constraint dcspp_ccstats_d_f foreign key (status_id) references dcspp_pay_status (status_id));


create table dcspp_gc_status (
	status_id	varchar2(40)	not null,
	auth_expiration	timestamp	null
,constraint dcspp_gc_status_p primary key (status_id)
,constraint dcspp_gcstats_d_f foreign key (status_id) references dcspp_pay_status (status_id));


create table dcspp_sc_status (
	status_id	varchar2(40)	not null,
	auth_expiration	timestamp	null
,constraint dcspp_sc_status_p primary key (status_id)
,constraint dcspp_scstats_d_f foreign key (status_id) references dcspp_pay_status (status_id));


create table dcspp_auth_status (
	payment_group_id	varchar2(40)	not null,
	auth_status	varchar2(254)	not null,
	sequence_num	integer	not null
,constraint dcspp_auth_statu_p primary key (payment_group_id,sequence_num)
,constraint dcspp_atpaymnt_g_f foreign key (payment_group_id) references dcspp_pay_group (payment_group_id));

create index auth_stat_pgid_idx on dcspp_auth_status (payment_group_id);

create table dcspp_debit_status (
	payment_group_id	varchar2(40)	not null,
	debit_status	varchar2(254)	not null,
	sequence_num	integer	not null
,constraint dcspp_debit_stat_p primary key (payment_group_id,sequence_num)
,constraint dcspp_depaymnt_g_f foreign key (payment_group_id) references dcspp_pay_group (payment_group_id));

create index debit_stat_pgi_idx on dcspp_debit_status (payment_group_id);

create table dcspp_cred_status (
	payment_group_id	varchar2(40)	not null,
	credit_status	varchar2(254)	not null,
	sequence_num	integer	not null
,constraint dcspp_cred_statu_p primary key (payment_group_id,sequence_num)
,constraint dcspp_crpaymntgr_f foreign key (payment_group_id) references dcspp_pay_group (payment_group_id));

create index cred_stat_pgid_idx on dcspp_cred_status (payment_group_id);

create table dcspp_shipitem_rel (
	relationship_id	varchar2(40)	not null,
	shipping_group_id	varchar2(40)	null,
	commerce_item_id	varchar2(40)	null,
	quantity	number(19,0)	null,
	returned_qty	number(19,0)	null,
	amount	number(19,7)	null,
	state	varchar2(40)	null,
	state_detail	varchar2(254)	null
,constraint dcspp_shipitem_r_p primary key (relationship_id)
,constraint dcspp_shreltnshp_f foreign key (relationship_id) references dcspp_relationship (relationship_id));

create index sirel_item_idx on dcspp_shipitem_rel (commerce_item_id);
create index sirel_shipgrp_idx on dcspp_shipitem_rel (shipping_group_id);

create table dcspp_rel_range (
	relationship_id	varchar2(40)	not null,
	low_bound	integer	null,
	high_bound	integer	null
,constraint dcspp_rel_range_p primary key (relationship_id));


create table dcspp_payitem_rel (
	relationship_id	varchar2(40)	not null,
	payment_group_id	varchar2(40)	null,
	commerce_item_id	varchar2(40)	null,
	quantity	number(19,0)	null,
	amount	number(19,7)	null
,constraint dcspp_payitem_re_p primary key (relationship_id)
,constraint dcspp_pareltnshp_f foreign key (relationship_id) references dcspp_relationship (relationship_id));

create index pirel_item_idx on dcspp_payitem_rel (commerce_item_id);
create index pirel_paygrp_idx on dcspp_payitem_rel (payment_group_id);

create table dcspp_payship_rel (
	relationship_id	varchar2(40)	not null,
	payment_group_id	varchar2(40)	null,
	shipping_group_id	varchar2(40)	null,
	amount	number(19,7)	null
,constraint dcspp_payship_re_p primary key (relationship_id)
,constraint dcspp_pshrltnshp_f foreign key (relationship_id) references dcspp_relationship (relationship_id));

create index psrel_paygrp_idx on dcspp_payship_rel (payment_group_id);
create index psrel_shipgrp_idx on dcspp_payship_rel (shipping_group_id);

create table dcspp_payorder_rel (
	relationship_id	varchar2(40)	not null,
	payment_group_id	varchar2(40)	null,
	order_id	varchar2(40)	null,
	amount	number(19,7)	null
,constraint dcspp_payorder_r_p primary key (relationship_id)
,constraint dcspp_odreltnshp_f foreign key (relationship_id) references dcspp_relationship (relationship_id));

create index porel_order_idx on dcspp_payorder_rel (order_id);
create index porel_paygrp_idx on dcspp_payorder_rel (payment_group_id);

create table dcspp_amount_info (
	amount_info_id	varchar2(40)	not null,
	type	integer	not null,
	version	integer	not null,
	currency_code	varchar2(10)	null,
	amount	number(19,7)	null,
	discounted	number(1,0)	null,
	amount_is_final	number(1,0)	null,
	final_rc	number(10)	null
,constraint dcspp_amount_inf_p primary key (amount_info_id)
,constraint dcspp_amount_in1_c check (discounted IN (0,1))
,constraint dcspp_amount_in2_c check (amount_is_final IN (0,1)));


create table dcspp_order_price (
	amount_info_id	varchar2(40)	not null,
	raw_subtotal	number(19,7)	null,
	tax	number(19,7)	null,
	shipping	number(19,7)	null,
	manual_adj_total	number(19,7)	null
,constraint dcspp_order_pric_p primary key (amount_info_id)
,constraint dcspp_oramnt_nfd_f foreign key (amount_info_id) references dcspp_amount_info (amount_info_id));


create table dcspp_item_price (
	amount_info_id	varchar2(40)	not null,
	list_price	number(19,7)	null,
	raw_total_price	number(19,7)	null,
	sale_price	number(19,7)	null,
	on_sale	number(1,0)	null,
	order_discount	number(19,7)	null,
	qty_discounted	number(19,0)	null,
	qty_as_qualifier	number(19,0)	null,
	price_list	varchar2(40)	null
,constraint dcspp_item_price_p primary key (amount_info_id)
,constraint dcspp_itamnt_nfd_f foreign key (amount_info_id) references dcspp_amount_info (amount_info_id)
,constraint dcspp_item_price_c check (on_sale IN (0,1)));


create table dcspp_tax_price (
	amount_info_id	varchar2(40)	not null,
	city_tax	number(19,7)	null,
	county_tax	number(19,7)	null,
	state_tax	number(19,7)	null,
	country_tax	number(19,7)	null
,constraint dcspp_tax_price_p primary key (amount_info_id)
,constraint dcspp_taamnt_nfd_f foreign key (amount_info_id) references dcspp_amount_info (amount_info_id));


create table dcspp_ship_price (
	amount_info_id	varchar2(40)	not null,
	raw_shipping	number(19,7)	null
,constraint dcspp_ship_price_p primary key (amount_info_id)
,constraint dcspp_shamnt_nfd_f foreign key (amount_info_id) references dcspp_amount_info (amount_info_id));


create table dcspp_amtinfo_adj (
	amount_info_id	varchar2(40)	not null,
	adjustments	varchar2(40)	not null,
	sequence_num	integer	not null
,constraint dcspp_amtinfo_ad_p primary key (amount_info_id,sequence_num)
,constraint dcspp_amamnt_nfd_f foreign key (amount_info_id) references dcspp_amount_info (amount_info_id));

create index amtinf_adj_aid_idx on dcspp_amtinfo_adj (amount_info_id);
create index amtinf_adj_adj_idx on dcspp_amtinfo_adj (adjustments);

create table dcspp_price_adjust (
	adjustment_id	varchar2(40)	not null,
	version	integer	not null,
	adj_description	varchar2(254)	null,
	pricing_model	varchar2(40)	null,
	manual_adjustment	varchar2(40)	null,
	adjustment	number(19,7)	null,
	qty_adjusted	integer	null
,constraint dcspp_price_adju_p primary key (adjustment_id));


create table dcspp_shipitem_sub (
	amount_info_id	varchar2(40)	not null,
	shipping_group_id	varchar2(42)	not null,
	ship_item_subtotal	varchar2(40)	not null
,constraint dcspp_shipitem_s_p primary key (amount_info_id,shipping_group_id)
,constraint dcspp_sbamnt_nfd_f foreign key (amount_info_id) references dcspp_amount_info (amount_info_id));

create index ship_item_sub_idx on dcspp_shipitem_sub (amount_info_id);

create table dcspp_taxshipitem (
	amount_info_id	varchar2(40)	not null,
	shipping_group_id	varchar2(42)	not null,
	tax_ship_item_sub	varchar2(40)	not null
,constraint dcspp_taxshipite_p primary key (amount_info_id,shipping_group_id)
,constraint dcspp_shamntxnfd_f foreign key (amount_info_id) references dcspp_amount_info (amount_info_id));

create index tax_ship_item_idx on dcspp_taxshipitem (amount_info_id);

create table dcspp_ntaxshipitem (
	amount_info_id	varchar2(40)	not null,
	shipping_group_id	varchar2(42)	not null,
	non_tax_item_sub	varchar2(40)	not null
,constraint dcspp_ntaxshipit_p primary key (amount_info_id,shipping_group_id)
,constraint dcspp_ntamnt_nfd_f foreign key (amount_info_id) references dcspp_amount_info (amount_info_id));

create index ntax_ship_item_idx on dcspp_ntaxshipitem (amount_info_id);

create table dcspp_shipitem_tax (
	amount_info_id	varchar2(40)	not null,
	shipping_group_id	varchar2(42)	not null,
	ship_item_tax	varchar2(40)	not null
,constraint dcspp_shipitem_t_p primary key (amount_info_id,shipping_group_id)
,constraint dcspp_txamnt_nfd_f foreign key (amount_info_id) references dcspp_amount_info (amount_info_id));

create index ship_item_tax_idx on dcspp_shipitem_tax (amount_info_id);

create table dcspp_itmprice_det (
	amount_info_id	varchar2(40)	not null,
	cur_price_details	varchar2(40)	not null,
	sequence_num	integer	not null
,constraint dcspp_itmprice_d_p primary key (amount_info_id,sequence_num)
,constraint dcspp_sbamntnfd_f foreign key (amount_info_id) references dcspp_amount_info (amount_info_id));

create index itmprc_det_aii_idx on dcspp_itmprice_det (amount_info_id);

create table dcspp_det_price (
	amount_info_id	varchar2(40)	not null,
	tax	number(19,7)	null,
	order_discount	number(19,7)	null,
	order_manual_adj	number(19,7)	null,
	quantity	number(19,0)	null,
	qty_as_qualifier	number(19,0)	null
,constraint dcspp_det_price_p primary key (amount_info_id));


create table dcspp_det_range (
	amount_info_id	varchar2(40)	not null,
	low_bound	integer	null,
	high_bound	integer	null
,constraint dcspp_det_range_p primary key (amount_info_id));


create table dcspp_order_adj (
	order_id	varchar2(40)	not null,
	adjustment_id	varchar2(40)	not null,
	sequence_num	integer	not null
,constraint dcspp_order_adj_p primary key (order_id,sequence_num)
,constraint dcspp_oradj_d_f foreign key (order_id) references dcspp_order (order_id));

create index order_adj_orid_idx on dcspp_order_adj (order_id);

create table dcspp_manual_adj (
	manual_adjust_id	varchar2(40)	not null,
	type	integer	not null,
	adjustment_type	integer	not null,
	reason	integer	not null,
	amount	number(19,7)	null,
	notes	varchar2(255)	null,
	version	integer	not null
,constraint dcspp_manual_adj_p primary key (manual_adjust_id));


create table dbcpp_sched_order (
	scheduled_order_id	varchar2(40)	not null,
	type	integer	not null,
	version	integer	not null,
	name	varchar2(32)	null,
	profile_id	varchar2(40)	null,
	create_date	timestamp	null,
	start_date	timestamp	null,
	end_date	timestamp	null,
	template_order	varchar2(32)	null,
	state	integer	null,
	next_scheduled	timestamp	null,
	schedule	varchar2(255)	null,
	site_id	varchar2(40)	null
,constraint dbcpp_sched_orde_p primary key (scheduled_order_id));

create index sched_tmplt_idx on dbcpp_sched_order (template_order);
create index sched_profile_idx on dbcpp_sched_order (profile_id);
create index sched_site_idx on dbcpp_sched_order (site_id);

create table dbcpp_sched_clone (
	scheduled_order_id	varchar2(40)	not null,
	cloned_order	varchar2(40)	not null,
	sequence_num	integer	not null
,constraint dbcpp_sched_clon_p primary key (scheduled_order_id,sequence_num)
,constraint dbcpp_scschedld__f foreign key (scheduled_order_id) references dbcpp_sched_order (scheduled_order_id));


create table dcspp_scherr_aux (
	scheduled_order_id	varchar2(40)	not null,
	sched_error_id	varchar2(40)	not null
,constraint dcspp_scherr_aux_p primary key (scheduled_order_id));

create index sched_error_idx on dcspp_scherr_aux (sched_error_id);

create table dcspp_sched_error (
	sched_error_id	varchar2(40)	not null,
	error_date	timestamp	not null
,constraint dcspp_sched_err_p primary key (sched_error_id));


create table dcspp_schd_errmsg (
	sched_error_id	varchar2(40)	not null,
	error_txt	varchar2(254)	not null,
	sequence_num	integer	not null
,constraint dcspp_schd_errs_p primary key (sched_error_id,sequence_num)
,constraint dcspp_sch_errs_f foreign key (sched_error_id) references dcspp_sched_error (sched_error_id));





-- the source for this section is 
-- dcs_mappers.sql





create table dcs_cart_event (
	id	varchar2(40)	not null,
	timestamp	timestamp	null,
	orderid	varchar2(40)	null,
	itemid	varchar2(40)	null,
	sessionid	varchar2(100)	null,
	parentsessionid	varchar2(100)	null,
	quantity	integer	null,
	amount	number(19,7)	null,
	profileid	varchar2(40)	null);


create table dcs_submt_ord_evt (
	id	varchar2(40)	not null,
	clocktime	timestamp	null,
	orderid	varchar2(40)	null,
	profileid	varchar2(40)	null,
	sessionid	varchar2(100)	null,
	parentsessionid	varchar2(100)	null);


create table dcs_prom_used_evt (
	id	varchar2(40)	not null,
	clocktime	timestamp	null,
	orderid	varchar2(40)	null,
	profileid	varchar2(40)	null,
	sessionid	varchar2(100)	null,
	parentsessionid	varchar2(100)	null,
	promotionid	varchar2(40)	null,
	order_amount	number(26,7)	null,
	discount	number(26,7)	null);


create table dcs_ord_merge_evt (
	id	varchar2(40)	not null,
	clocktime	timestamp	null,
	sourceorderid	varchar2(40)	null,
	destorderid	varchar2(40)	null,
	profileid	varchar2(40)	null,
	sessionid	varchar2(100)	null,
	parentsessionid	varchar2(100)	null,
	sourceremoved	number(1,0)	null
,constraint dcs_ordmergeevt_ck check (sourceremoved in (0,1)));


create table dcs_promo_rvkd (
	id	varchar2(40)	not null,
	time_stamp	timestamp	null,
	promotionid	varchar2(254)	not null,
	profileid	varchar2(254)	not null,
	sessionid	varchar2(100)	null,
	parentsessionid	varchar2(100)	null);


create table dcs_promo_grntd (
	id	varchar2(40)	not null,
	time_stamp	timestamp	null,
	promotionid	varchar2(254)	not null,
	profileid	varchar2(254)	not null,
	sessionid	varchar2(100)	null,
	parentsessionid	varchar2(100)	null);





-- the source for this section is 
-- versioned_claimable_ddl.sql





create table dcspp_claimable (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	claimable_id	varchar2(40)	not null,
	version	integer	not null,
	type	integer	not null,
	status	integer	null,
	expiration_date	timestamp	null,
	last_modified	timestamp	null
,constraint dcspp_claimable_p primary key (claimable_id,asset_version));

create index dcspp_claimabl_wsx on dcspp_claimable (workspace_id);
create index dcspp_claimabl_cix on dcspp_claimable (checkin_date);

create table dcspp_giftcert (
	asset_version	number(19)	not null,
	giftcertificate_id	varchar2(40)	not null,
	amount	double precision	not null,
	amount_authorized	double precision	not null,
	amount_remaining	double precision	not null,
	purchaser_id	varchar2(40)	null,
	purchase_date	timestamp	null,
	last_used	timestamp	null
,constraint dcspp_giftcert_p primary key (giftcertificate_id,asset_version));

create index claimable_user_idx on dcspp_giftcert (purchaser_id);

create table dcs_storecred_clm (
	asset_version	number(19)	not null,
	store_credit_id	varchar2(40)	not null,
	amount	number(19,7)	not null,
	amount_authorized	number(19,7)	not null,
	amount_remaining	number(19,7)	not null,
	owner_id	varchar2(40)	null,
	issue_date	timestamp	null,
	expiration_date	timestamp	null,
	last_used	timestamp	null
,constraint dcs_storecred_cl_p primary key (store_credit_id,asset_version));

create index storecr_issue_idx on dcs_storecred_clm (issue_date);
create index storecr_owner_idx on dcs_storecred_clm (owner_id);

create table dcspp_cp_folder (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	folder_id	varchar2(40)	not null,
	name	varchar2(254)	not null,
	parent_folder	varchar2(40)	null
,constraint dcspp_cp_folder_p primary key (folder_id,asset_version));

create index dcspp_cp_folde_wsx on dcspp_cp_folder (workspace_id);
create index dcspp_cp_folde_cix on dcspp_cp_folder (checkin_date);

create table dcspp_coupon (
	asset_version	number(19)	not null,
	coupon_id	varchar2(40)	not null,
	promotion_id	varchar2(40)	not null
,constraint dcspp_coupon_p primary key (coupon_id,promotion_id,asset_version));


create table dcspp_coupon_info (
	asset_version	number(19)	not null,
	coupon_id	varchar2(40)	not null,
	display_name	varchar2(254)	null,
	use_promo_site	number(10)	null,
	parent_folder	varchar2(40)	null
,constraint dcspp_copninfo_p primary key (coupon_id,asset_version));





-- the source for this section is 
-- versioned_priceLists_ddl.sql





create table dcs_price_list (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	price_list_id	varchar2(40)	not null,
	version	integer	not null,
	display_name	varchar2(254)	null,
	description	varchar2(254)	null,
	creation_date	timestamp	null,
	last_mod_date	timestamp	null,
	start_date	timestamp	null,
	end_date	timestamp	null,
	locale	number(10)	null,
	base_price_list	varchar2(40)	null,
	item_acl	varchar2(1024)	null
,constraint dcs_price_list_p primary key (price_list_id,asset_version));

create index dcs_price_list_wsx on dcs_price_list (workspace_id);
create index dcs_price_list_cix on dcs_price_list (checkin_date);

create table dcs_complex_price (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	complex_price_id	varchar2(40)	not null,
	version	integer	not null
,constraint dcs_complex_pric_p primary key (complex_price_id,asset_version));

create index dcs_complex_pr_wsx on dcs_complex_price (workspace_id);
create index dcs_complex_pr_cix on dcs_complex_price (checkin_date);

create table dcs_price (
	sec_asset_version	number(19)	null,
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	price_id	varchar2(40)	not null,
	version	integer	not null,
	price_list	varchar2(40)	not null,
	product_id	varchar2(40)	null,
	sku_id	varchar2(40)	null,
	parent_sku_id	varchar2(40)	null,
	pricing_scheme	integer	not null,
	list_price	number(19,7)	null,
	complex_price	varchar2(40)	null
,constraint dcs_price_p primary key (price_id,asset_version));

create index dcs_price_idx1 on dcs_price (product_id);
create index dcs_price_idx2 on dcs_price (price_list,sku_id);
create index dcs_price_wsx on dcs_price (workspace_id);
create index dcs_price_cix on dcs_price (checkin_date);

create table dcs_price_levels (
	asset_version	number(19)	not null,
	complex_price_id	varchar2(40)	not null,
	price_levels	varchar2(40)	not null,
	sequence_num	integer	not null
,constraint dcs_price_levels_p primary key (complex_price_id,sequence_num,asset_version));


create table dcs_price_level (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	price_level_id	varchar2(40)	not null,
	version	integer	not null,
	quantity	integer	not null,
	price	number(19,7)	not null
,constraint dcs_price_level_p primary key (price_level_id,asset_version));

create index dcs_price_leve_wsx on dcs_price_level (workspace_id);
create index dcs_price_leve_cix on dcs_price_level (checkin_date);

create table dcs_gen_fol_pl (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	folder_id	varchar2(40)	not null,
	type	integer	not null,
	name	varchar2(40)	not null,
	parent	varchar2(40)	null,
	description	varchar2(254)	null,
	item_acl	varchar2(1024)	null
,constraint dcs_gen_fol_pl_p primary key (folder_id,asset_version));

create index dcs_gen_fol_pl_wsx on dcs_gen_fol_pl (workspace_id);
create index dcs_gen_fol_pl_cix on dcs_gen_fol_pl (checkin_date);

create table dcs_child_fol_pl (
	sec_asset_version	number(19)	not null,
	asset_version	number(19)	not null,
	folder_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	child_folder_id	varchar2(40)	not null
,constraint dcs_child_fol_pl_p primary key (folder_id,sequence_num,asset_version,sec_asset_version));


create table dcs_plfol_chld (
	asset_version	number(19)	not null,
	plfol_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	price_list_id	varchar2(40)	not null
,constraint dcs_plfol_chld_p primary key (plfol_id,sequence_num,asset_version));





-- the source for this section is 
-- versioned_commerce_site_ddl.sql




-- This file contains create table statements, which will configureyour database for use MultiSite

create table dcs_site (
	asset_version	number(19)	not null,
	id	varchar2(40)	not null,
	catalog_id	varchar2(40)	null,
	list_pricelist_id	varchar2(40)	null,
	sale_pricelist_id	varchar2(40)	null
,constraint dcs_site_p primary key (id,asset_version));





-- the source for this section is 
-- order_markers_ddl.sql





create table dcs_order_markers (
	marker_id	varchar2(40)	not null,
	order_id	varchar2(40)	not null,
	marker_key	varchar2(100)	not null,
	marker_value	varchar2(100)	null,
	marker_data	varchar2(100)	null,
	creation_date	timestamp	null,
	version	number(10)	not null,
	marker_type	number(10)	null
,constraint dcsordermarkers_p primary key (marker_id,order_id)
,constraint dcsordermarkers_f foreign key (order_id) references dcspp_order (order_id));

create index dcs_ordrmarkers1_x on dcs_order_markers (order_id);

create table dcspp_commerce_item_markers (
	marker_id	varchar2(40)	not null,
	commerce_item_id	varchar2(40)	not null,
	marker_key	varchar2(100)	not null,
	marker_value	varchar2(100)	null,
	marker_data	varchar2(100)	null,
	creation_date	timestamp	null,
	version	number(10)	not null,
	marker_type	number(10)	null
,constraint dcscitemmarkers_p primary key (marker_id,commerce_item_id)
,constraint dcscitemmarkers_f foreign key (commerce_item_id) references dcspp_item (commerce_item_id));

create index dcs_itemmarkers1_x on dcspp_commerce_item_markers (commerce_item_id);




-- the source for this section is 
-- abandoned_order_ddl.sql




-- $Id: //product/DCS/version/10.0.3/templates/DCS/AbandonedOrderServices/sql/abandoned_order_ddl.xml#1 $

create table dcspp_ord_abandon (
	abandonment_id	varchar2(40)	not null,
	version	number(10)	not null,
	order_id	varchar2(40)	not null,
	ord_last_updated	timestamp	null,
	abandon_state	varchar2(40)	null,
	abandonment_count	number(10)	null,
	abandonment_date	timestamp	null,
	reanimation_date	timestamp	null,
	convert_date	timestamp	null,
	lost_date	timestamp	null
,constraint dcspp_ord_abndn_p primary key (abandonment_id));

create index dcspp_ordabandn1_x on dcspp_ord_abandon (order_id);

create table dcs_user_abandoned (
	id	varchar2(40)	not null,
	order_id	varchar2(40)	not null,
	profile_id	varchar2(40)	not null
,constraint dcs_usr_abndnd_p primary key (id));


create table drpt_conv_order (
	order_id	varchar2(40)	not null,
	converted_date	timestamp	not null,
	amount	number(19,7)	not null,
	promo_count	number(10)	not null,
	promo_value	number(19,7)	not null
,constraint drpt_conv_order_p primary key (order_id));


create table drpt_session_ord (
	dataset_id	varchar2(40)	not null,
	order_id	varchar2(40)	not null,
	date_time	timestamp	not null,
	amount	number(19,7)	not null,
	submitted	number(10)	not null,
	order_persistent	number(1)	null,
	session_id	varchar2(40)	null,
	parent_session_id	varchar2(40)	null
,constraint drpt_session_ord_p primary key (order_id));





-- the source for this section is 
-- abandoned_order_views.sql




create or replace view drpt_abandon_ord
as
      select oa.abandonment_date as abandonment_date, ai.amount as amount, decode(oa.abandon_state, 'CONVERTED', 100, 0) as converted from dcspp_order o, dcspp_ord_abandon oa, dcspp_amount_info ai where oa.order_id=o.order_id and o.price_info=ai.amount_info_id
         ;


create or replace view drpt_tns_abndn_ord
as
      select date_time as abandonment_date, amount as amount from drpt_session_ord where submitted=0
         ;




-- the source for this section is 
-- versioned_custom_catalog_ddl.sql





create table dcs_catalog (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	catalog_id	varchar2(40)	not null,
	version	integer	not null,
	display_name	varchar2(254)	null,
	creation_date	timestamp	null,
	last_mod_date	timestamp	null,
	migration_status	number(3,0)	null,
	migration_index	number(10)	null,
	item_acl	varchar2(1024)	null
,constraint dcs_catalog_p primary key (catalog_id,asset_version));

create index dcs_catalog_wsx on dcs_catalog (workspace_id);
create index dcs_catalog_cix on dcs_catalog (checkin_date);

create table dcs_root_cats (
	sec_asset_version	number(19)	not null,
	asset_version	number(19)	not null,
	catalog_id	varchar2(40)	not null,
	root_cat_id	varchar2(40)	not null
,constraint dcs_root_cats_p primary key (catalog_id,root_cat_id,asset_version,sec_asset_version));

create index dcs_rootcatscat_id on dcs_root_cats (root_cat_id);

create table dcs_allroot_cats (
	asset_version	number(19)	not null,
	catalog_id	varchar2(40)	not null,
	root_cat_id	varchar2(40)	not null
,constraint dcs_allroot_cats_p primary key (catalog_id,root_cat_id,asset_version));


create table dcs_root_subcats (
	sec_asset_version	number(19)	not null,
	asset_version	number(19)	not null,
	catalog_id	varchar2(40)	not null,
	sub_catalog_id	varchar2(40)	not null
,constraint dcs_root_subcats_p primary key (catalog_id,sub_catalog_id,asset_version,sec_asset_version));


create table dcs_category_info (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	category_info_id	varchar2(40)	not null,
	version	integer	not null,
	item_acl	varchar2(1024)	null
,constraint dcs_category_inf_p primary key (category_info_id,asset_version));

create index dcs_category_i_wsx on dcs_category_info (workspace_id);
create index dcs_category_i_cix on dcs_category_info (checkin_date);

create table dcs_product_info (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	product_info_id	varchar2(40)	not null,
	version	integer	not null,
	parent_cat_id	varchar2(40)	null,
	item_acl	varchar2(1024)	null
,constraint dcs_product_info_p primary key (product_info_id,asset_version));

create index dcs_product_in_wsx on dcs_product_info (workspace_id);
create index dcs_product_in_cix on dcs_product_info (checkin_date);

create table dcs_sku_info (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	sku_info_id	varchar2(40)	not null,
	version	integer	not null,
	item_acl	varchar2(1024)	null
,constraint dcs_sku_info_p primary key (sku_info_id,asset_version));

create index dcs_sku_info_wsx on dcs_sku_info (workspace_id);
create index dcs_sku_info_cix on dcs_sku_info (checkin_date);

create table dcs_cat_subcats (
	sec_asset_version	number(19)	not null,
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	catalog_id	varchar2(40)	not null
,constraint dcs_cat_subcats_p primary key (category_id,sequence_num,asset_version,sec_asset_version));

create index dcs_catsubcatlogid on dcs_cat_subcats (catalog_id);

create table dcs_cat_subroots (
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	sub_category_id	varchar2(40)	not null
,constraint dcs_cat_subroots_p primary key (category_id,sequence_num,asset_version));


create table dcs_cat_catinfo (
	sec_asset_version	number(19)	not null,
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	catalog_id	varchar2(40)	not null,
	category_info_id	varchar2(40)	not null
,constraint dcs_cat_catinfo_p primary key (category_id,catalog_id,asset_version,sec_asset_version));


create table dcs_catinfo_anc (
	asset_version	number(19)	not null,
	category_info_id	varchar2(40)	not null,
	anc_cat_id	varchar2(40)	not null
,constraint dcs_catinfo_anc_p primary key (category_info_id,anc_cat_id,asset_version));


create table dcs_prd_prdinfo (
	sec_asset_version	number(19)	not null,
	asset_version	number(19)	not null,
	product_id	varchar2(40)	not null,
	catalog_id	varchar2(40)	not null,
	product_info_id	varchar2(40)	not null
,constraint dcs_prd_prdinfo_p primary key (product_id,catalog_id,asset_version,sec_asset_version));


create table dcs_prdinfo_rdprd (
	asset_version	number(19)	not null,
	product_info_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	related_prd_id	varchar2(40)	not null
,constraint dcs_prdinfo_rdpr_p primary key (product_info_id,sequence_num,asset_version));


create table dcs_prdinfo_anc (
	asset_version	number(19)	not null,
	product_info_id	varchar2(40)	not null,
	anc_cat_id	varchar2(40)	not null
,constraint dcs_prdinfo_anc_p primary key (product_info_id,anc_cat_id,asset_version));


create table dcs_sku_skuinfo (
	sec_asset_version	number(19)	not null,
	asset_version	number(19)	not null,
	sku_id	varchar2(40)	not null,
	catalog_id	varchar2(40)	not null,
	sku_info_id	varchar2(40)	not null
,constraint dcs_sku_skuinfo_p primary key (sku_id,catalog_id,asset_version,sec_asset_version));


create table dcs_skuinfo_rplc (
	asset_version	number(19)	not null,
	sku_info_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	replacement	varchar2(40)	not null
,constraint dcs_skuinfo_rplc_p primary key (sku_info_id,sequence_num,asset_version));


create table dcs_gen_fol_cat (
	asset_version	number(19)	not null,
	workspace_id	varchar2(40)	not null,
	branch_id	varchar2(40)	not null,
	is_head	number(1)	not null,
	version_deleted	number(1)	not null,
	version_editable	number(1)	not null,
	pred_version	number(19)	null,
	checkin_date	timestamp	null,
	folder_id	varchar2(40)	not null,
	type	integer	not null,
	name	varchar2(40)	not null,
	parent	varchar2(40)	null,
	description	varchar2(254)	null,
	item_acl	varchar2(1024)	null
,constraint dcs_gen_fol_cat_p primary key (folder_id,asset_version));

create index dcs_gen_fol_ca_wsx on dcs_gen_fol_cat (workspace_id);
create index dcs_gen_fol_ca_cix on dcs_gen_fol_cat (checkin_date);

create table dcs_child_fol_cat (
	sec_asset_version	number(19)	not null,
	asset_version	number(19)	not null,
	folder_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	child_folder_id	varchar2(40)	not null
,constraint dcs_child_fol_ca_p primary key (folder_id,sequence_num,asset_version,sec_asset_version));


create table dcs_catfol_chld (
	sec_asset_version	number(19)	not null,
	asset_version	number(19)	not null,
	catfol_id	varchar2(40)	not null,
	sequence_num	integer	not null,
	catalog_id	varchar2(40)	not null
,constraint dcs_catfol_chld_p primary key (catfol_id,sequence_num,asset_version,sec_asset_version));


create table dcs_catfol_sites (
	asset_version	number(19)	not null,
	catfol_id	varchar2(40)	not null,
	site_id	varchar2(40)	not null
,constraint dcs_catfl_sites_pk primary key (catfol_id,site_id,asset_version));


create table dcs_dir_anc_ctlgs (
	asset_version	number(19)	not null,
	catalog_id	varchar2(40)	not null,
	sequence_num	number(10)	not null,
	anc_catalog_id	varchar2(40)	not null
,constraint dcs_dirancctlgs_pk primary key (catalog_id,sequence_num,asset_version));


create table dcs_ind_anc_ctlgs (
	asset_version	number(19)	not null,
	catalog_id	varchar2(40)	not null,
	sequence_num	number(10)	not null,
	anc_catalog_id	varchar2(40)	not null
,constraint dcs_indancctlgs_pk primary key (catalog_id,sequence_num,asset_version));


create table dcs_ctlg_anc_cats (
	asset_version	number(19)	not null,
	catalog_id	varchar2(40)	not null,
	sequence_num	number(10)	not null,
	category_id	varchar2(40)	not null
,constraint dcs_ctlganccats_pk primary key (catalog_id,sequence_num,asset_version));


create table dcs_cat_anc_cats (
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	sequence_num	number(10)	not null,
	anc_category_id	varchar2(40)	not null
,constraint dcs_cat_anccats_pk primary key (category_id,sequence_num,asset_version));


create table dcs_cat_prnt_cats (
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	catalog_id	varchar2(40)	not null,
	parent_ctgy_id	varchar2(40)	not null
,constraint dcs_catprntcats_pk primary key (category_id,catalog_id,asset_version));


create table dcs_prd_prnt_cats (
	asset_version	number(19)	not null,
	product_id	varchar2(40)	not null,
	catalog_id	varchar2(40)	not null,
	category_id	varchar2(40)	not null
,constraint dcs_prdprntcats_pk primary key (product_id,catalog_id,asset_version));


create table dcs_prd_anc_cats (
	asset_version	number(19)	not null,
	product_id	varchar2(40)	not null,
	sequence_num	number(10)	not null,
	category_id	varchar2(40)	not null
,constraint dcs_prdanc_cats_pk primary key (product_id,sequence_num,asset_version));


create table dcs_cat_catalogs (
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	catalog_id	varchar2(40)	not null
,constraint dcs_cat_catalgs_pk primary key (category_id,catalog_id,asset_version));


create table dcs_prd_catalogs (
	asset_version	number(19)	not null,
	product_id	varchar2(40)	not null,
	catalog_id	varchar2(40)	not null
,constraint dcs_prd_catalgs_pk primary key (product_id,catalog_id,asset_version));


create table dcs_sku_catalogs (
	asset_version	number(19)	not null,
	sku_id	varchar2(40)	not null,
	catalog_id	varchar2(40)	not null
,constraint dcs_sku_catalgs_pk primary key (sku_id,catalog_id,asset_version));


create table dcs_catalog_sites (
	asset_version	number(19)	not null,
	catalog_id	varchar2(40)	not null,
	site_id	varchar2(40)	not null
,constraint dcs_catlg_sites_pk primary key (catalog_id,site_id,asset_version));

create index catlg_site_id_idx on dcs_catalog_sites (site_id);

create table dcs_category_sites (
	asset_version	number(19)	not null,
	category_id	varchar2(40)	not null,
	site_id	varchar2(40)	not null
,constraint dcs_cat_sites_pk primary key (category_id,site_id,asset_version));

create index cat_site_id_idx on dcs_category_sites (site_id);

create table dcs_product_sites (
	asset_version	number(19)	not null,
	product_id	varchar2(40)	not null,
	site_id	varchar2(40)	not null
,constraint dcs_prod_sites_pk primary key (product_id,site_id,asset_version));

create index prd_site_id_idx on dcs_product_sites (site_id);

create table dcs_sku_sites (
	asset_version	number(19)	not null,
	sku_id	varchar2(40)	not null,
	site_id	varchar2(40)	not null
,constraint dcs_sku_sites_pk primary key (sku_id,site_id,asset_version));

create index sku_site_id_idx on dcs_sku_sites (site_id);




-- the source for this section is 
-- custom_catalog_user_ddl.sql





create table dcs_user_catalog (
	user_id	varchar2(40)	not null,
	user_catalog	varchar2(40)	null
,constraint dcs_usr_catalog_pk primary key (user_id));




