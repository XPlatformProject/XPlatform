function(xplatform_add_dependence target dependence)

add_custom_command(
        TARGET ${target} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
                $<TARGET_FILE:${dependence}>
                $<TARGET_FILE_DIR:${target}>)

add_dependencies(${target} ${dependence})
endfunction(xplatform_add_dependence)

function(xplatform_add_dependence_module target dependence)

add_custom_command(
        TARGET ${target} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
                $<TARGET_FILE:${dependence}>
                $<TARGET_FILE_DIR:${target}>/Engine)

add_dependencies(${target} ${dependence})
endfunction(xplatform_add_dependence_module)

function(xplatform_copy_file target in_path out_path)

add_custom_command(
        TARGET ${target} COMMAND PRE_BUILD
         ${CMAKE_COMMAND} -E copy
                ${in_path}
                ${out_path}
)

endfunction(xplatform_copy_file)