%% Migration: settings

UpSQL = "
  CREATE TABLE settings(
    id serial unique,
    name text not null,
    value text not null
  );
".

DownSQL = "DROP TABLE settings;".

{create_settings,
  fun(up)   –> boss_db:execute(UpSQL);
     (down) –> boss_db:execute(DownSQL)
  end}.


