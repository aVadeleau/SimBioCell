# SimBioCell

## English

### Techs/Tools Used
- Godot Engine v3.5 beta 4 (An open-source game engine)

### Description

> A research project made in group of four people including me (Master's Degree students).
> We worked for a researcher in bio-informatics that wanted modelings tools for his biology students. For that we designed and developped a modeling tool that can simulate many situations for the biology students.

> The modeling tools have 3 different level : 
>- The beginner level which correspond to vizualise the premade simulations 
>- The advanced level which correspond to do visual scripting with the differents custom box (a box contains a piece of code that do something).
>- The expert level which correspond to directly code the simulations wanted

### The premade simulations 

>- **Prey/Predator** : a simulation about **wolf** and **sheep**, when a wolf see a sheep it will chase it, if the wolf touch the sheep the sheep become a wolf and etc. If the sheep see a wolf it will try to flee.

>- **Drepanocytose** : a simulation that represent the **Drepanocytose sickness** which is about a red blood cell deformation

>- **Blood Vessel** : a test simulation that show the possibility of the modeling tool, it's about **blood cells** that go trough a **vein** whith a **contaminated cell**, if the contaminated cell touch a blood cell it will fuse with it, if a contaminated cell touch another contaminated cell it will multiply it.

>- **BeakerSimulation(BécherSimulation)** : a simulation about two type of **molecules**(**A** and **B** type) inside a **beaker** with a **shaker**, if the molecules touch the shaker (that turns continuously) it will send them upwards. If **A** molecule touch a **B** molecule type they will fuse and make a **AB** molecule.

### Tree structure
> We have 7 folder in this project : 
>- PreFabObjects : contains the unmovable object like  the terrain and etc.
>- PreFabAgents : contains the movable object that will interact with the scene like a molecule, a sheep ...
>- Tools : It represent the different tools generated for the simulation like a spawner of agents or a portal/teleporter.
>- PreFabBehaviour : contains the custom box made for the advanced level
>- Materials : this one contain the decor of the scene
>- ExpertMode : This one contains the different function that we implemented for the custom box, it correpsond to the expert level
>- SceneExample  : contains the premade simulations

### Run the simulations : 
The premade simulations are in *7-SceneExamples* folder. 





