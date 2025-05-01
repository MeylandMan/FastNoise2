project "FastNoise2"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"src/FastNoise/**.h",
		"src/FastNoise/**.cpp",
		
		"src/FastSIMD/Internal/**.h",
		"src/FastSIMD/Example/Example.h",
		"src/FastSIMD/**.cpp",
	}
	
	includedirs
    {
        "include"
    }
		
	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"
		defines { "FASTNOISE_EXPORT" }

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "action:vs*"
		buildoptions { "/arch:AVX512" }
