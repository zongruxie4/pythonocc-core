/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/
%define TCOLGEOM2DDOCSTRING
"TColGeom2d module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_tcolgeom2d.html"
%enddef
%module (package="OCC.Core", docstring=TCOLGEOM2DDOCSTRING) TColGeom2d


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<TColGeom2d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom2d_module.hxx>
#include<Standard_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom2d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TColGeom2d_HArray1OfBSplineCurve)
%wrap_handle(TColGeom2d_HArray1OfBezierCurve)
%wrap_handle(TColGeom2d_HArray1OfCurve)
%wrap_handle(TColGeom2d_HSequenceOfBoundedCurve)
%wrap_handle(TColGeom2d_HSequenceOfCurve)
/* end handles declaration */

/* templates */
%template(TColGeom2d_Array1OfBSplineCurve) NCollection_Array1<opencascade::handle<Geom2d_BSplineCurve>>;
Array1ExtendIter(opencascade::handle<Geom2d_BSplineCurve>)

%template(TColGeom2d_Array1OfBezierCurve) NCollection_Array1<opencascade::handle<Geom2d_BezierCurve>>;
Array1ExtendIter(opencascade::handle<Geom2d_BezierCurve>)

%template(TColGeom2d_Array1OfCurve) NCollection_Array1<opencascade::handle<Geom2d_Curve>>;
Array1ExtendIter(opencascade::handle<Geom2d_Curve>)

%template(TColGeom2d_SequenceOfBoundedCurve) NCollection_Sequence<opencascade::handle<Geom2d_BoundedCurve>>;

%extend NCollection_Sequence<opencascade::handle<Geom2d_BoundedCurve>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColGeom2d_SequenceOfCurve) NCollection_Sequence<opencascade::handle<Geom2d_Curve>>;

%extend NCollection_Sequence<opencascade::handle<Geom2d_Curve>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TColGeom2d_SequenceOfGeometry) NCollection_Sequence<opencascade::handle<Geom2d_Geometry>>;

%extend NCollection_Sequence<opencascade::handle<Geom2d_Geometry>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<Geom2d_BSplineCurve>> TColGeom2d_Array1OfBSplineCurve;
typedef NCollection_Array1<opencascade::handle<Geom2d_BezierCurve>> TColGeom2d_Array1OfBezierCurve;
typedef NCollection_Array1<opencascade::handle<Geom2d_Curve>> TColGeom2d_Array1OfCurve;
typedef NCollection_Sequence<opencascade::handle<Geom2d_BoundedCurve>> TColGeom2d_SequenceOfBoundedCurve;
typedef NCollection_Sequence<opencascade::handle<Geom2d_Curve>> TColGeom2d_SequenceOfCurve;
typedef NCollection_Sequence<opencascade::handle<Geom2d_Geometry>> TColGeom2d_SequenceOfGeometry;
/* end typedefs declaration */

/* harray1 classes */

class TColGeom2d_HArray1OfBSplineCurve : public TColGeom2d_Array1OfBSplineCurve, public Standard_Transient {
  public:
    TColGeom2d_HArray1OfBSplineCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColGeom2d_HArray1OfBSplineCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const TColGeom2d_Array1OfBSplineCurve::value_type& theValue);
    TColGeom2d_HArray1OfBSplineCurve(const TColGeom2d_Array1OfBSplineCurve& theOther);
    const TColGeom2d_Array1OfBSplineCurve& Array1();
    TColGeom2d_Array1OfBSplineCurve& ChangeArray1();
};
%make_alias(TColGeom2d_HArray1OfBSplineCurve)


class TColGeom2d_HArray1OfBezierCurve : public TColGeom2d_Array1OfBezierCurve, public Standard_Transient {
  public:
    TColGeom2d_HArray1OfBezierCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColGeom2d_HArray1OfBezierCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const TColGeom2d_Array1OfBezierCurve::value_type& theValue);
    TColGeom2d_HArray1OfBezierCurve(const TColGeom2d_Array1OfBezierCurve& theOther);
    const TColGeom2d_Array1OfBezierCurve& Array1();
    TColGeom2d_Array1OfBezierCurve& ChangeArray1();
};
%make_alias(TColGeom2d_HArray1OfBezierCurve)


class TColGeom2d_HArray1OfCurve : public TColGeom2d_Array1OfCurve, public Standard_Transient {
  public:
    TColGeom2d_HArray1OfCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColGeom2d_HArray1OfCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const TColGeom2d_Array1OfCurve::value_type& theValue);
    TColGeom2d_HArray1OfCurve(const TColGeom2d_Array1OfCurve& theOther);
    const TColGeom2d_Array1OfCurve& Array1();
    TColGeom2d_Array1OfCurve& ChangeArray1();
};
%make_alias(TColGeom2d_HArray1OfCurve)

/* harray2 classes */
/* hsequence classes */
class TColGeom2d_HSequenceOfBoundedCurve : public TColGeom2d_SequenceOfBoundedCurve, public Standard_Transient {
  public:
    TColGeom2d_HSequenceOfBoundedCurve();
    TColGeom2d_HSequenceOfBoundedCurve(const TColGeom2d_SequenceOfBoundedCurve& theOther);
    const TColGeom2d_SequenceOfBoundedCurve& Sequence();
    void Append (const TColGeom2d_SequenceOfBoundedCurve::value_type& theItem);
    void Append (TColGeom2d_SequenceOfBoundedCurve& theSequence);
    TColGeom2d_SequenceOfBoundedCurve& ChangeSequence();
};
%make_alias(TColGeom2d_HSequenceOfBoundedCurve)


class TColGeom2d_HSequenceOfCurve : public TColGeom2d_SequenceOfCurve, public Standard_Transient {
  public:
    TColGeom2d_HSequenceOfCurve();
    TColGeom2d_HSequenceOfCurve(const TColGeom2d_SequenceOfCurve& theOther);
    const TColGeom2d_SequenceOfCurve& Sequence();
    void Append (const TColGeom2d_SequenceOfCurve::value_type& theItem);
    void Append (TColGeom2d_SequenceOfCurve& theSequence);
    TColGeom2d_SequenceOfCurve& ChangeSequence();
};
%make_alias(TColGeom2d_HSequenceOfCurve)


/* class aliases */
%pythoncode {
}
