project "ImGui"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")


	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_widgets.cpp",
        "imgui_tables.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",
        "imgui_impl_vulkan.cpp",
        "imgui_impl_vulkan.h",
        "imgui_impl_glfw.cpp",
        "imgui_impl_glfw.h"
	}

	includedirs
	{
            "src",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.VulkanSDK}"
	}

	links
	{
		"GLFW",
		"%{Library.Vulkan}"
	}


	filter "system:windows"
		systemversion "latest"
		cppdialect "C++20"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++20"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
