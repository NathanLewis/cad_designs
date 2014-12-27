import bpy
import math

def deleteAll():
    bpy.ops.object.select_all(action = 'SELECT')
    bpy.ops.object.delete()


def difference(first,second):
    modifier = first.modifiers.new('Modifier', 'BOOLEAN')
    modifier.object = second
    modifier.operation = 'DIFFERENCE'
    bpy.ops.object.modifier_apply(apply_as='DATA', modifier=modifier.name)
    scene = bpy.context.scene
    scene.objects.unlink(second)

def hollowCylinder(outer_radius,inner_radius,height,location):
	bpy.ops.mesh.primitive_cylinder_add(vertices=200, radius=outer_radius, depth=height, location=location)
	outer_c = bpy.context.active_object
	bpy.ops.object.shade_smooth()
	bpy.ops.mesh.primitive_cylinder_add(vertices=200, radius=inner_radius, depth=height, location=location)
	inner_c = bpy.context.active_object
	bpy.ops.object.shade_smooth()
	difference(outer_c,inner_c)

deleteAll()

def mainCylinder():
	hollowCylinder(7.25, 6.5, 12, (0, 0, 0))


def bottomRing():
	hollowCylinder(8.75, 7.25, 2, (0, 0, -5))

def firstTopRing():
	hollowCylinder(7.25, 5.5, 1, (0, 0, 5.5))

def secondTopRing():
	hollowCylinder(7.25, 5, 2, (0, 0, 6.5))

mainCylinder()
bottomRing()
firstTopRing()
secondTopRing()

