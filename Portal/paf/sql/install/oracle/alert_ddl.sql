


--  @version $Id: //app/portal/version/10.0.3/paf/sql/alert_ddl.xml#2 $$Change: 651448 $

create table alt_user (
	id	varchar2(40)	not null,
	version	number(10)	default 0 not null,
	target_id	varchar2(40)	not null,
	target_type	varchar2(40)	not null,
	source_id	varchar2(40)	null,
	msg_type	varchar2(255)	null,
	message_bean	blob	null,
	creation_date	timestamp	null,
	end_date	timestamp	null,
	start_date	timestamp	null,
	delete_flag	number(1,0)	not null
,constraint alt_userpk primary key (id));

create index alt_user_idx on alt_user (target_id,target_type,source_id);

create table alt_group (
	id	varchar2(40)	not null,
	version	number(10)	not null,
	target_id	varchar2(40)	not null,
	target_type	varchar2(40)	not null,
	source_id	varchar2(40)	null,
	msg_type	varchar2(255)	null,
	message_bean	blob	null,
	creation_date	timestamp	null,
	end_date	timestamp	null,
	start_date	timestamp	null,
	delete_flag	number(1,0)	not null
,constraint alt_grouppk primary key (id));

create index alt_group_idx on alt_group (target_id,target_type,source_id);

create table alt_user_alert_rel (
	id	varchar2(40)	not null,
	alert_id	varchar2(40)	not null
,constraint alt_useralertrel_p primary key (id,alert_id));


create table alt_user_pref (
	id	varchar2(40)	not null,
	source_id	varchar2(40)	not null,
	source_type	varchar2(40)	not null,
	version	number(10)	not null,
	event_type	varchar2(255)	null,
	name	varchar2(40)	not null,
	value	varchar2(40)	not null
,constraint alt_user_prefpk primary key (id));


create table alt_userpref_rel (
	id	varchar2(40)	not null,
	alert_user_pref_id	varchar2(40)	not null
,constraint alt_user_relpk primary key (id,alert_user_pref_id));

create index alt_userpref_idx on alt_userpref_rel (alert_user_pref_id);

create table alt_gear (
	id	varchar2(40)	not null,
	source_id	varchar2(40)	not null,
	source_type	varchar2(40)	not null,
	version	number(10)	not null,
	message_type	varchar2(255)	not null,
	name	varchar2(40)	not null,
	value	varchar2(40)	not null,
	resource_bundle	varchar2(255)	not null
,constraint alt_gearpk primary key (id));


create table alt_gear_rel (
	id	varchar2(40)	not null,
	name	varchar2(40)	not null,
	gear_id	varchar2(40)	not null
,constraint alt_gear_relpk primary key (id,gear_id));

create index alt_gear_idx on alt_gear_rel (gear_id);

create table alt_gear_def (
	id	varchar2(40)	not null,
	version	number(10)	not null,
	message_type	varchar2(255)	not null,
	name	varchar2(40)	not null,
	value	varchar2(40)	not null,
	resource_bundle	varchar2(255)	not null
,constraint alt_gear_defpk primary key (id));


create table alt_gear_def_rel (
	id	varchar2(40)	not null,
	name	varchar2(40)	not null,
	gear_def_id	varchar2(40)	not null
,constraint alt_def_relpk primary key (id,gear_def_id));

create index alt_gear_def_idx on alt_gear_def_rel (gear_def_id);

create table alt_channel (
	channel_id	varchar2(40)	not null,
	version	number(10)	not null,
	component_name	varchar2(255)	not null,
	display_name	varchar2(255)	not null
,constraint alt_channel_pk primary key (channel_id));


create table alt_chan_usr_rel (
	alt_user_pref_id	varchar2(40)	not null,
	channel_id	varchar2(40)	not null
,constraint alt_chnusr_relpk primary key (channel_id,alt_user_pref_id));




