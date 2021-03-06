


--  @version $Id: //product/DAF/version/10.0.3/Search/Index/src/sql/search_ddl.xml#2 $$Change: 651448 $
-- This file contains create table statements, which will configure your database for use with the new search schema.
-- Add the search_config... used to track which generation is the currentgeneration.

create table srch_config (
	config_path	varchar(254)	not null,
	content_id	varchar(40)	not null,
	generation	integer	not null,
	claimed_generation	integer	null,
	nxt_inc_generation	integer	null,
	uniq_server_id	varchar(254)	null,
	last_activity	datetime	null,
	last_full_index	datetime	null,
	last_incr_index	datetime	null
,constraint srch_config_p primary key (config_path,content_id))

--  Holds an association of a config path, content ID, and  repository name. Used to reduce the length of the primary key for  srch_update_queue 

create table srch_config_repo (
	id	varchar(40)	not null,
	config_path	varchar(254)	not null,
	content_id	varchar(40)	not null,
	repository_path	varchar(254)	not null
,constraint srch_config_repo_p primary key (id))

-- Add the search_update_queue... used by the IncrementalLoader to trackrepository changes.

create table srch_update_queue (
	repository_id	varchar(254)	not null,
	config_repo_id	varchar(40)	not null,
	generation	integer	not null,
	item_desc_name	varchar(64)	not null,
	change_type	integer	not null
,constraint srch_up_queue_p primary key (repository_id,config_repo_id,generation,item_desc_name)
,constraint srch_upq_cfrp_f1 foreign key (config_repo_id) references srch_config_repo (id))

create index srch_updateque1_x on srch_update_queue (config_repo_id)
-- Add the search_update_queue... used by the IncrementalLoader to trackrepository changes.

create table srch_update_vqueue (
	id	varchar(40)	not null,
	config_path	varchar(254)	not null,
	generation	integer	not null,
	repository_path	varchar(254)	not null,
	item_desc_name	varchar(64)	not null,
	repository_id	varchar(254)	not null,
	change_type	integer	not null,
	dev_line_id	varchar(40)	not null,
	asset_version	integer	not null
,constraint srch_up_vqueue_p primary key (id))

create index srch_up_vqueue on srch_update_vqueue (config_path,generation,repository_path,item_desc_name,repository_id)


go
