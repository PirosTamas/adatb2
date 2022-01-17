create or replace package pkg_exception is

  no_pilota_exc EXCEPTION;
  gc_no_pilota_exc_code CONSTANT NUMBER := -20000;
  PRAGMA EXCEPTION_INIT(no_pilota_exc, -20000);
  
  no_konstruktor_exc EXCEPTION;
  gc_no_konstruktor_exc_code CONSTANT NUMBER := -20100;
  PRAGMA EXCEPTION_INIT(no_pilota_exc, -20100);
  
  no_futam_exc EXCEPTION;
  gc_no_futam_exc_code CONSTANT NUMBER := -20200;
  PRAGMA EXCEPTION_INIT(no_pilota_exc, -20200);
  
  no_versenyauto_exc EXCEPTION;
  gc_no_versenyauto_exc_code CONSTANT NUMBER := -20300;
  PRAGMA EXCEPTION_INIT(no_pilota_exc, -20300);

end pkg_exception;
/
