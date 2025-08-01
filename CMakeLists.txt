cmake_minimum_required(VERSION 3.30)
project(audio)

set(CMAKE_CXX_STANDARD 23)

include(FetchContent)

FetchContent_Declare(
	JUCE
	GIT_REPOSITORY https://github.com/juce-framework/JUCE
	GIT_TAG d6181bde38d858c283c3b7bf699ce6340c050b5d
)
FetchContent_MakeAvailable(JUCE)

include_directories("${CMAKE_SOURCE_DIR}/include")

juce_add_plugin(audio
	COMPANY_NAME anotherSimpleCoder
	VERSION 0.0.1
	IS_SYNTH FALSE
	NEEDS_MIDI_INPUT FALSE
	NEEDS_MIDI_OUTPUT FALSE
	PLUGIN_MANUFACTURER_CODE ASCA
	PLUGIN_CODE AUDI
	FORMATS VST3
	PRODUCT_NAME "Audio"
)

target_sources(audio PRIVATE
		src/PluginProcessor.cc
)

target_link_libraries(audio
	PRIVATE
		juce::juce_audio_utils
	PUBLIC
		juce::juce_recommended_config_flags
		juce::juce_recommended_lto_flags
		juce::juce_recommended_warning_flags
)

target_compile_definitions(audio
	PUBLIC
		JUCE_WEB_BROWSER=0
		JUCE_USE_CURL=0
		JUCE_VST3_CAN_REPLACE_VST2=0
)