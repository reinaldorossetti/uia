#include "Stdafx.h"

extern "C" {
  __declspec(dllexport) void RangeValue_Release(RangeValueInformationPtr rangeValueInfo) {
    delete rangeValueInfo;
  }

  __declspec(dllexport) RangeValueInformationPtr RangeValue_Information(ElementInformationPtr element, char* errorInfo, const int errorInfoLength) {
    try {
      return new RangeValueInformation(ElementFrom(element)->As<RangeValuePattern^>(RangeValuePattern::Pattern)->Current);
    } catch(Exception^ e) {
      StringHelper::CopyToUnmanagedString(e, errorInfo, errorInfoLength);
      return NULL;
    }
  }

  __declspec(dllexport) void RangeValue_SetValue(ElementInformationPtr element, double value, char* errorInfo, const int errorInfoLength) {
    try {
      return ElementFrom(element)->As<RangeValuePattern^>(RangeValuePattern::Pattern)->SetValue(value);
    } catch(Exception^ e) {
      StringHelper::CopyToUnmanagedString(e, errorInfo, errorInfoLength);
    }
  }

}