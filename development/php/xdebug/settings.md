# settings (incomplete list)

| name                              | default   | description               |
| --------------------------------- | --------- | ------------------------- |
| xdebug.auto_trace                 | 0         | tracing of functions      |
| xdebug.cli_color                  | 0         | color var_dumps etc.      |
| xdebug.collect_assignments        | 0         | add variable assignments to function into the |
| xdebug.collect_includes           | 1         | add file name includes to the trace or not    |
| xdebug.collect_params             | 0         | add parameters passed to the function into the trace |
| xdebug.collect_return             | 0         | add return value of function to the trace |
| xdebug.collect_vars               | 0         | add informations about variables used in which scope to the trace |
| xdebug.coverage_enable            | 1         | code coverage analysis |
| xdebug.default_enable             | 1         | show stack trace on an error event by default | 
| xdebug.extended_info              | 1         | enforce "extended_info" mode in php |
| xdebug.force_display_errors       | 0         | overwrites phps display_error settings |
| xdebug.idekey                     | string    | which key should pass to the DBGp debugger handler |
| xdebug.max_nesting_level          | 100       | maximum nesting level |
| xdebug.profiler_append            | 0         | append instead of overwriting |
| xdebug.profiler_enable            | 0         | enable profiling |
| xdebug.profiler_output_dir        | string    | profiler output directory |
| xdebug.remote_autostart           | 0         | xdebug tries to connect to a remot debugging session, even without specific HTTP GET/POST |
| xdebug.remote_connect_back        | 0         | xdebug will ignore remote_host and try to connect to the client that made the HTTP request |
| xdebug.remote_cookie_expire_time  | 3600      | session cookie life time |
| xdebug.remote_enable              | 0         | try to contact a debug client |
| xdebug.remote_handler             | dbgp      | 'php3|GDB|dbgp' |
| xdebug.remote_host                | string    | the client where the remote debug client is running |
| xdebug.remote_log                 | string    | log file where all remote connections are logged |
| xdebug.remote_mode                | req       | 'req|jit', req = on each request, jit = only when error occures |
| xdebug.remote_port                | 9000      | xdebug port |
| xdebug.scream                     | 0         | disable the @-operator |
| xdebug.show_exception_trace       | 0         | stack trace each exception, also the caught ones |
| xdebug.show_local_vars            | 0         | show all variables in top most scope |
| xdebug.show_mem_delta             | 0         | show differences in memory usage between function calls |


# links

* http://www.xdebug.org/docs/all_settings
* http://gggeek.altervista.org/2007/11/26/the-completely-unofficial-xdebugini/
