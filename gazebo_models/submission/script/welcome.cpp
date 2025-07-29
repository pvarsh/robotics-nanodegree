#include <gazebo/gazebo.hh>

namespace gazebo
{
	// Define a new class WorldPluginMyRobot tat inherits from the WorldPlugin class
	class WorldPluginSubmission: public WorldPlugin
	{
	public:
		// Constructor for WorldPluginMyRobot
		WorldPluginSubmission() : WorldPlugin()
		{
			printf("Welcome to the assignment submission world!\n");
		}
	public:
		// Load function is called by Gazebo when loading the plugin
		void Load(physics::WorldPtr _world, sdf::ElementPtr _sdf) {}
	};
	// Register this plugin with Gazebo,
	// making it discoverable at runtime
	GZ_REGISTER_WORLD_PLUGIN(WorldPluginSubmission);
}

