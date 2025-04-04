#!/usr/bin/python

##Copyright 2010-2019 Thomas Paviot (tpaviot@gmail.com)
# 6
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU Lesser General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU Lesser General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

import random

from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeTorus, BRepPrimAPI_MakeBox
from OCC.Display.WebGl import threejs_renderer, x3dom_renderer

from OCC.Extend.TopologyUtils import TopologyExplorer

torus_shp = BRepPrimAPI_MakeTorus(20.0, 10.0).Shape()


def test_threejs_render_torus():
    """Render a simple torus in threejs"""
    my_threejs_renderer = threejs_renderer.ThreejsRenderer()
    dict_shape, dict_edge = my_threejs_renderer.DisplayShape(torus_shp)
    assert dict_shape
    assert not dict_edge


def test_threejs_random_boxes():
    """Test: threejs 10 random boxes"""
    my_threejs_renderer = threejs_renderer.ThreejsRenderer()
    for _ in range(10):
        box_shp = BRepPrimAPI_MakeBox(
            random.random() * 20, random.random() * 20, random.random() * 20
        ).Shape()
        rnd_color = (random.random(), random.random(), random.random())
        dict_shape, dict_edge = my_threejs_renderer.DisplayShape(
            box_shp,
            export_edges=True,
            color=rnd_color,
            transparency=random.random(),
        )
        assert dict_shape
        assert dict_edge


def test_x3dom_random_mesh_quality():
    """Test: threejs 10 random boxes"""
    my_threejs_renderer = threejs_renderer.ThreejsRenderer()
    # torus_shp = BRepPrimAPI_MakeTorus(20., 10.).Shape()
    dict_shape, dict_edge = my_threejs_renderer.DisplayShape(
        torus_shp, mesh_quality=1.0
    )
    assert dict_shape
    assert not dict_edge
    dict_shape, dict_edge = my_threejs_renderer.DisplayShape(
        torus_shp, mesh_quality=0.8
    )
    assert dict_shape
    assert not dict_edge
    dict_shape, dict_edge = my_threejs_renderer.DisplayShape(
        torus_shp, mesh_quality=2.0
    )
    assert dict_shape
    assert not dict_edge


def test_x3dom_render_torus():
    """Render a simple torus using x3dom"""
    my_x3dom_renderer = x3dom_renderer.X3DomRenderer()
    dict_shape, dict_edge = my_x3dom_renderer.DisplayShape(torus_shp)
    assert dict_shape
    assert not dict_edge


def test_threejs_edge():
    """Test: threejs 10 random boxes"""
    my_threejs_renderer = threejs_renderer.ThreejsRenderer()
    for edg in TopologyExplorer(torus_shp).edges():
        dict_shape, dict_edge = my_threejs_renderer.DisplayShape(edg, mesh_quality=1.0)
        assert not dict_shape
        assert dict_edge


def test_threejs_wire():
    """Test: threejs 10 random boxes"""
    my_threejs_renderer = threejs_renderer.ThreejsRenderer()
    for wire in TopologyExplorer(torus_shp).wires():
        dict_shape, dict_edge = my_threejs_renderer.DisplayShape(wire, mesh_quality=1.0)
        assert not dict_shape
        assert dict_edge


def test_x3d_edge():
    """Test: threejs 10 random boxes"""
    my_x3dom_renderer = x3dom_renderer.X3DomRenderer()
    for edg in TopologyExplorer(torus_shp).edges():
        dict_shape, dict_edge = my_x3dom_renderer.DisplayShape(edg, mesh_quality=1.0)
        assert not dict_shape
        assert dict_edge


def test_x3d_wire():
    """Test: threejs 10 random boxes"""
    my_x3dom_renderer = x3dom_renderer.X3DomRenderer()
    for wire in TopologyExplorer(torus_shp).wires():
        dict_shape, dict_edge = my_x3dom_renderer.DisplayShape(wire, mesh_quality=1.0)
        assert not dict_shape
        assert dict_edge
