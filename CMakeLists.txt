cmake_minimum_required(VERSION 3.7...3.29)

# Might not work for some older MSVC compiler versions. See:
# <https://github.com/fmtlib/fmt/issues/809>
if(${CMAKE_VERSION} VERSION_LESS 3.12)
  cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
endif()

# Enable Hot Reload for MSVC compilers if supported.
if(POLICY CMP0141)
  cmake_policy(SET CMP0141 NEW)
  set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT
      "$<IF:$<AND:$<C_COMPILER_ID:MSVC>,$<CXX_COMPILER_ID:MSVC>>,$<$<CONFIG:Debug,RelWithDebInfo>:EditAndContinue>,$<$<CONFIG:Debug,RelWithDebInfo>:ProgramDatabase>>"
  )
endif()

project(
  "LambdaCalculusParser"
  VERSION 0.0.1
  DESCRIPTION "Parser for lambda expressions." # For CMake >=3.9
  LANGUAGES CXX)

add_subdirectory("src")

install(
  TARGETS lambda-calculus-parser
  EXPORT ${PROJECT_NAME}_Targets
  INCLUDES
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

if(CMAKE_VERSION VERSION_GREATER 3.12)
  set_property(TARGET lambda-calculus-parser PROPERTY CXX_STANDARD 23)
endif()

