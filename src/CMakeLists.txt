cmake_minimum_required(VERSION 3.2 FATAL_ERROR)

add_executable(MultiplayerDemo
	main.cpp
	"PlayerEntity.hpp"
	"PlayerEntity.cpp"
	"InputService.hpp"
	"InputService.cpp"
	"CastleEntity.cpp"
 	"PuckEntity.hpp"
	"PuckEntity.cpp"
	"GameML.hpp"
	MessageHud.cpp
	MessageHud.hpp
	HealthBarComponent.cpp
	HealthBarComponent.hpp
	FireballEntity.cpp
	FireballEntity.hpp)

find_package(torch REQUIRED)

set_property(TARGET MultiplayerDemo PROPERTY CXX_STANDARD 17)

target_link_libraries(MultiplayerDemo Strife.Engine Strife.ML torch)

# Copy torch dlls
if (MSVC)
  file(GLOB TORCH_DLLS "${TORCH_DIR}/lib/*.dll")

  message(================ ${TORCH_DIR})

  add_custom_command(TARGET MultiplayerDemo
                     POST_BUILD
                     COMMAND ${CMAKE_COMMAND} -E copy_if_different
                     ${TORCH_DLLS}
                     $<TARGET_FILE_DIR:Sample>)
endif()
