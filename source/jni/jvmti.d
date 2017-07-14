/*
 * Copyright (c) 2003, 2011, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

/* AUTOMATICALLY GENERATED FILE - DO NOT EDIT */

/* Include file for the Java(tm) Virtual Machine Tool Interface */

module jni.jvmti;

import core.stdc.config;
import jni.jni;
import std.bitmanip;

extern (C) :



enum {
    JVMTI_VERSION_1     = 0x30010000,
    JVMTI_VERSION_1_0   = 0x30010000,
    JVMTI_VERSION_1_1   = 0x30010100,
    JVMTI_VERSION_1_2   = 0x30010200,

    JVMTI_VERSION       = 0x30000000 + (1 * 0x10000) + (2 * 0x100) + 1 /// version: 1.2.1 
}

jint Agent_OnLoad (JavaVM* vm, char* options, void* reserved);

jint Agent_OnAttach (JavaVM* vm, char* options, void* reserved);

void Agent_OnUnload (JavaVM* vm);

/* Forward declaration of the environment */

alias jvmtiEnv = const(jvmtiInterface_1_)*;

/* Derived Base Types */

alias jthread = _jobject*;
alias jthreadGroup = _jobject*;
alias jlocation = c_long;
struct _jrawMonitorID;
alias jrawMonitorID = _jrawMonitorID*;
alias jniNativeInterface = JNINativeInterface_;

/* Constants */

/* Thread State Flags */

enum {
    JVMTI_THREAD_STATE_ALIVE = 0x0001,
    JVMTI_THREAD_STATE_TERMINATED = 0x0002,
    JVMTI_THREAD_STATE_RUNNABLE = 0x0004,
    JVMTI_THREAD_STATE_BLOCKED_ON_MONITOR_ENTER = 0x0400,
    JVMTI_THREAD_STATE_WAITING = 0x0080,
    JVMTI_THREAD_STATE_WAITING_INDEFINITELY = 0x0010,
    JVMTI_THREAD_STATE_WAITING_WITH_TIMEOUT = 0x0020,
    JVMTI_THREAD_STATE_SLEEPING = 0x0040,
    JVMTI_THREAD_STATE_IN_OBJECT_WAIT = 0x0100,
    JVMTI_THREAD_STATE_PARKED = 0x0200,
    JVMTI_THREAD_STATE_SUSPENDED = 0x100000,
    JVMTI_THREAD_STATE_INTERRUPTED = 0x200000,
    JVMTI_THREAD_STATE_IN_NATIVE = 0x400000,
    JVMTI_THREAD_STATE_VENDOR_1 = 0x10000000,
    JVMTI_THREAD_STATE_VENDOR_2 = 0x20000000,
    JVMTI_THREAD_STATE_VENDOR_3 = 0x40000000
}

/* java.lang.Thread.State Conversion Masks */

enum {
    JVMTI_JAVA_LANG_THREAD_STATE_MASK = JVMTI_THREAD_STATE_TERMINATED | JVMTI_THREAD_STATE_ALIVE | JVMTI_THREAD_STATE_RUNNABLE | JVMTI_THREAD_STATE_BLOCKED_ON_MONITOR_ENTER | JVMTI_THREAD_STATE_WAITING | JVMTI_THREAD_STATE_WAITING_INDEFINITELY | JVMTI_THREAD_STATE_WAITING_WITH_TIMEOUT,
    JVMTI_JAVA_LANG_THREAD_STATE_NEW = 0,
    JVMTI_JAVA_LANG_THREAD_STATE_TERMINATED = JVMTI_THREAD_STATE_TERMINATED,
    JVMTI_JAVA_LANG_THREAD_STATE_RUNNABLE = JVMTI_THREAD_STATE_ALIVE | JVMTI_THREAD_STATE_RUNNABLE,
    JVMTI_JAVA_LANG_THREAD_STATE_BLOCKED = JVMTI_THREAD_STATE_ALIVE | JVMTI_THREAD_STATE_BLOCKED_ON_MONITOR_ENTER,
    JVMTI_JAVA_LANG_THREAD_STATE_WAITING = JVMTI_THREAD_STATE_ALIVE | JVMTI_THREAD_STATE_WAITING | JVMTI_THREAD_STATE_WAITING_INDEFINITELY,
    JVMTI_JAVA_LANG_THREAD_STATE_TIMED_WAITING = JVMTI_THREAD_STATE_ALIVE | JVMTI_THREAD_STATE_WAITING | JVMTI_THREAD_STATE_WAITING_WITH_TIMEOUT

}

/* Thread Priority Constants */

enum {
    JVMTI_THREAD_MIN_PRIORITY = 1,
    JVMTI_THREAD_NORM_PRIORITY = 5,
    JVMTI_THREAD_MAX_PRIORITY = 10
}

/* Heap Filter Flags */

enum {
    JVMTI_HEAP_FILTER_TAGGED = 0x4,
    JVMTI_HEAP_FILTER_UNTAGGED = 0x8,
    JVMTI_HEAP_FILTER_CLASS_TAGGED = 0x10,
    JVMTI_HEAP_FILTER_CLASS_UNTAGGED = 0x20
}

/* Heap Visit Control Flags */

enum {
    JVMTI_VISIT_OBJECTS = 0x100,
    JVMTI_VISIT_ABORT = 0x8000
}

/* Heap Reference Enumeration */

enum jvmtiHeapReferenceKind {
    JVMTI_HEAP_REFERENCE_CLASS = 1,
    JVMTI_HEAP_REFERENCE_FIELD = 2,
    JVMTI_HEAP_REFERENCE_ARRAY_ELEMENT = 3,
    JVMTI_HEAP_REFERENCE_CLASS_LOADER = 4,
    JVMTI_HEAP_REFERENCE_SIGNERS = 5,
    JVMTI_HEAP_REFERENCE_PROTECTION_DOMAIN = 6,
    JVMTI_HEAP_REFERENCE_INTERFACE = 7,
    JVMTI_HEAP_REFERENCE_STATIC_FIELD = 8,
    JVMTI_HEAP_REFERENCE_CONSTANT_POOL = 9,
    JVMTI_HEAP_REFERENCE_SUPERCLASS = 10,
    JVMTI_HEAP_REFERENCE_JNI_GLOBAL = 21,
    JVMTI_HEAP_REFERENCE_SYSTEM_CLASS = 22,
    JVMTI_HEAP_REFERENCE_MONITOR = 23,
    JVMTI_HEAP_REFERENCE_STACK_LOCAL = 24,
    JVMTI_HEAP_REFERENCE_JNI_LOCAL = 25,
    JVMTI_HEAP_REFERENCE_THREAD = 26,
    JVMTI_HEAP_REFERENCE_OTHER = 27
}

/* Primitive Type Enumeration */

enum jvmtiPrimitiveType {
    JVMTI_PRIMITIVE_TYPE_BOOLEAN = 90,
    JVMTI_PRIMITIVE_TYPE_BYTE = 66,
    JVMTI_PRIMITIVE_TYPE_CHAR = 67,
    JVMTI_PRIMITIVE_TYPE_SHORT = 83,
    JVMTI_PRIMITIVE_TYPE_INT = 73,
    JVMTI_PRIMITIVE_TYPE_LONG = 74,
    JVMTI_PRIMITIVE_TYPE_FLOAT = 70,
    JVMTI_PRIMITIVE_TYPE_DOUBLE = 68
}

/* Heap Object Filter Enumeration */

enum jvmtiHeapObjectFilter {
    JVMTI_HEAP_OBJECT_TAGGED = 1,
    JVMTI_HEAP_OBJECT_UNTAGGED = 2,
    JVMTI_HEAP_OBJECT_EITHER = 3
}

/* Heap Root Kind Enumeration */

enum jvmtiHeapRootKind {
    JVMTI_HEAP_ROOT_JNI_GLOBAL = 1,
    JVMTI_HEAP_ROOT_SYSTEM_CLASS = 2,
    JVMTI_HEAP_ROOT_MONITOR = 3,
    JVMTI_HEAP_ROOT_STACK_LOCAL = 4,
    JVMTI_HEAP_ROOT_JNI_LOCAL = 5,
    JVMTI_HEAP_ROOT_THREAD = 6,
    JVMTI_HEAP_ROOT_OTHER = 7
}

/* Object Reference Enumeration */

enum jvmtiObjectReferenceKind {
    JVMTI_REFERENCE_CLASS = 1,
    JVMTI_REFERENCE_FIELD = 2,
    JVMTI_REFERENCE_ARRAY_ELEMENT = 3,
    JVMTI_REFERENCE_CLASS_LOADER = 4,
    JVMTI_REFERENCE_SIGNERS = 5,
    JVMTI_REFERENCE_PROTECTION_DOMAIN = 6,
    JVMTI_REFERENCE_INTERFACE = 7,
    JVMTI_REFERENCE_STATIC_FIELD = 8,
    JVMTI_REFERENCE_CONSTANT_POOL = 9
}

/* Iteration Control Enumeration */

enum jvmtiIterationControl {
    JVMTI_ITERATION_CONTINUE = 1,
    JVMTI_ITERATION_IGNORE = 2,
    JVMTI_ITERATION_ABORT = 0
}

/* Class Status Flags */

enum {
    JVMTI_CLASS_STATUS_VERIFIED = 1,
    JVMTI_CLASS_STATUS_PREPARED = 2,
    JVMTI_CLASS_STATUS_INITIALIZED = 4,
    JVMTI_CLASS_STATUS_ERROR = 8,
    JVMTI_CLASS_STATUS_ARRAY = 16,
    JVMTI_CLASS_STATUS_PRIMITIVE = 32
}

/* Event Enable/Disable */

enum jvmtiEventMode {
    JVMTI_ENABLE = 1,
    JVMTI_DISABLE = 0
}

/* Extension Function/Event Parameter Types */

enum jvmtiParamTypes {
    JVMTI_TYPE_JBYTE = 101,
    JVMTI_TYPE_JCHAR = 102,
    JVMTI_TYPE_JSHORT = 103,
    JVMTI_TYPE_JINT = 104,
    JVMTI_TYPE_JLONG = 105,
    JVMTI_TYPE_JFLOAT = 106,
    JVMTI_TYPE_JDOUBLE = 107,
    JVMTI_TYPE_JBOOLEAN = 108,
    JVMTI_TYPE_JOBJECT = 109,
    JVMTI_TYPE_JTHREAD = 110,
    JVMTI_TYPE_JCLASS = 111,
    JVMTI_TYPE_JVALUE = 112,
    JVMTI_TYPE_JFIELDID = 113,
    JVMTI_TYPE_JMETHODID = 114,
    JVMTI_TYPE_CCHAR = 115,
    JVMTI_TYPE_CVOID = 116,
    JVMTI_TYPE_JNIENV = 117
}

/* Extension Function/Event Parameter Kinds */

enum jvmtiParamKind {
    JVMTI_KIND_IN = 91,
    JVMTI_KIND_IN_PTR = 92,
    JVMTI_KIND_IN_BUF = 93,
    JVMTI_KIND_ALLOC_BUF = 94,
    JVMTI_KIND_ALLOC_ALLOC_BUF = 95,
    JVMTI_KIND_OUT = 96,
    JVMTI_KIND_OUT_BUF = 97
}

/* Timer Kinds */

enum jvmtiTimerKind {
    JVMTI_TIMER_USER_CPU = 30,
    JVMTI_TIMER_TOTAL_CPU = 31,
    JVMTI_TIMER_ELAPSED = 32
}

/* Phases of execution */

enum jvmtiPhase {
    JVMTI_PHASE_ONLOAD = 1,
    JVMTI_PHASE_PRIMORDIAL = 2,
    JVMTI_PHASE_START = 6,
    JVMTI_PHASE_LIVE = 4,
    JVMTI_PHASE_DEAD = 8
}

/* Version Interface Types */

enum {
    JVMTI_VERSION_INTERFACE_JNI     = 0x00000000,
    JVMTI_VERSION_INTERFACE_JVMTI   = 0x30000000
}

/* Version Masks */

enum {
    JVMTI_VERSION_MASK_INTERFACE_TYPE = 0x70000000,
    JVMTI_VERSION_MASK_MAJOR = 0x0FFF0000,
    JVMTI_VERSION_MASK_MINOR = 0x0000FF00,
    JVMTI_VERSION_MASK_MICRO = 0x000000FF
}

/* Version Shifts */

enum {
    JVMTI_VERSION_SHIFT_MAJOR = 16,
    JVMTI_VERSION_SHIFT_MINOR = 8,
    JVMTI_VERSION_SHIFT_MICRO = 0
}

/* Verbose Flag Enumeration */

enum jvmtiVerboseFlag {
    JVMTI_VERBOSE_OTHER = 0,
    JVMTI_VERBOSE_GC = 1,
    JVMTI_VERBOSE_CLASS = 2,
    JVMTI_VERBOSE_JNI = 4
}

/* JLocation Format Enumeration */

enum jvmtiJlocationFormat
{
    JVMTI_JLOCATION_JVMBCI = 1,
    JVMTI_JLOCATION_MACHINEPC = 2,
    JVMTI_JLOCATION_OTHER = 0
}

/* Resource Exhaustion Flags */

enum {
    JVMTI_RESOURCE_EXHAUSTED_OOM_ERROR = 0x0001,
    JVMTI_RESOURCE_EXHAUSTED_JAVA_HEAP = 0x0002,
    JVMTI_RESOURCE_EXHAUSTED_THREADS = 0x0004
}

/* Errors */

enum jvmtiError {
    JVMTI_ERROR_NONE = 0,
    JVMTI_ERROR_INVALID_THREAD = 10,
    JVMTI_ERROR_INVALID_THREAD_GROUP = 11,
    JVMTI_ERROR_INVALID_PRIORITY = 12,
    JVMTI_ERROR_THREAD_NOT_SUSPENDED = 13,
    JVMTI_ERROR_THREAD_SUSPENDED = 14,
    JVMTI_ERROR_THREAD_NOT_ALIVE = 15,
    JVMTI_ERROR_INVALID_OBJECT = 20,
    JVMTI_ERROR_INVALID_CLASS = 21,
    JVMTI_ERROR_CLASS_NOT_PREPARED = 22,
    JVMTI_ERROR_INVALID_METHODID = 23,
    JVMTI_ERROR_INVALID_LOCATION = 24,
    JVMTI_ERROR_INVALID_FIELDID = 25,
    JVMTI_ERROR_NO_MORE_FRAMES = 31,
    JVMTI_ERROR_OPAQUE_FRAME = 32,
    JVMTI_ERROR_TYPE_MISMATCH = 34,
    JVMTI_ERROR_INVALID_SLOT = 35,
    JVMTI_ERROR_DUPLICATE = 40,
    JVMTI_ERROR_NOT_FOUND = 41,
    JVMTI_ERROR_INVALID_MONITOR = 50,
    JVMTI_ERROR_NOT_MONITOR_OWNER = 51,
    JVMTI_ERROR_INTERRUPT = 52,
    JVMTI_ERROR_INVALID_CLASS_FORMAT = 60,
    JVMTI_ERROR_CIRCULAR_CLASS_DEFINITION = 61,
    JVMTI_ERROR_FAILS_VERIFICATION = 62,
    JVMTI_ERROR_UNSUPPORTED_REDEFINITION_METHOD_ADDED = 63,
    JVMTI_ERROR_UNSUPPORTED_REDEFINITION_SCHEMA_CHANGED = 64,
    JVMTI_ERROR_INVALID_TYPESTATE = 65,
    JVMTI_ERROR_UNSUPPORTED_REDEFINITION_HIERARCHY_CHANGED = 66,
    JVMTI_ERROR_UNSUPPORTED_REDEFINITION_METHOD_DELETED = 67,
    JVMTI_ERROR_UNSUPPORTED_VERSION = 68,
    JVMTI_ERROR_NAMES_DONT_MATCH = 69,
    JVMTI_ERROR_UNSUPPORTED_REDEFINITION_CLASS_MODIFIERS_CHANGED = 70,
    JVMTI_ERROR_UNSUPPORTED_REDEFINITION_METHOD_MODIFIERS_CHANGED = 71,
    JVMTI_ERROR_UNMODIFIABLE_CLASS = 79,
    JVMTI_ERROR_NOT_AVAILABLE = 98,
    JVMTI_ERROR_MUST_POSSESS_CAPABILITY = 99,
    JVMTI_ERROR_NULL_POINTER = 100,
    JVMTI_ERROR_ABSENT_INFORMATION = 101,
    JVMTI_ERROR_INVALID_EVENT_TYPE = 102,
    JVMTI_ERROR_ILLEGAL_ARGUMENT = 103,
    JVMTI_ERROR_NATIVE_METHOD = 104,
    JVMTI_ERROR_CLASS_LOADER_UNSUPPORTED = 106,
    JVMTI_ERROR_OUT_OF_MEMORY = 110,
    JVMTI_ERROR_ACCESS_DENIED = 111,
    JVMTI_ERROR_WRONG_PHASE = 112,
    JVMTI_ERROR_INTERNAL = 113,
    JVMTI_ERROR_UNATTACHED_THREAD = 115,
    JVMTI_ERROR_INVALID_ENVIRONMENT = 116,
    JVMTI_ERROR_MAX = 116
}

/* Event IDs */

enum jvmtiEvent {
    JVMTI_MIN_EVENT_TYPE_VAL = 50,
    JVMTI_EVENT_VM_INIT = 50,
    JVMTI_EVENT_VM_DEATH = 51,
    JVMTI_EVENT_THREAD_START = 52,
    JVMTI_EVENT_THREAD_END = 53,
    JVMTI_EVENT_CLASS_FILE_LOAD_HOOK = 54,
    JVMTI_EVENT_CLASS_LOAD = 55,
    JVMTI_EVENT_CLASS_PREPARE = 56,
    JVMTI_EVENT_VM_START = 57,
    JVMTI_EVENT_EXCEPTION = 58,
    JVMTI_EVENT_EXCEPTION_CATCH = 59,
    JVMTI_EVENT_SINGLE_STEP = 60,
    JVMTI_EVENT_FRAME_POP = 61,
    JVMTI_EVENT_BREAKPOINT = 62,
    JVMTI_EVENT_FIELD_ACCESS = 63,
    JVMTI_EVENT_FIELD_MODIFICATION = 64,
    JVMTI_EVENT_METHOD_ENTRY = 65,
    JVMTI_EVENT_METHOD_EXIT = 66,
    JVMTI_EVENT_NATIVE_METHOD_BIND = 67,
    JVMTI_EVENT_COMPILED_METHOD_LOAD = 68,
    JVMTI_EVENT_COMPILED_METHOD_UNLOAD = 69,
    JVMTI_EVENT_DYNAMIC_CODE_GENERATED = 70,
    JVMTI_EVENT_DATA_DUMP_REQUEST = 71,
    JVMTI_EVENT_MONITOR_WAIT = 73,
    JVMTI_EVENT_MONITOR_WAITED = 74,
    JVMTI_EVENT_MONITOR_CONTENDED_ENTER = 75,
    JVMTI_EVENT_MONITOR_CONTENDED_ENTERED = 76,
    JVMTI_EVENT_RESOURCE_EXHAUSTED = 80,
    JVMTI_EVENT_GARBAGE_COLLECTION_START = 81,
    JVMTI_EVENT_GARBAGE_COLLECTION_FINISH = 82,
    JVMTI_EVENT_OBJECT_FREE = 83,
    JVMTI_EVENT_VM_OBJECT_ALLOC = 84,
    JVMTI_MAX_EVENT_TYPE_VAL = 84
}

/* Pre-Declarations */

alias jvmtiThreadInfo = _jvmtiThreadInfo;

alias jvmtiMonitorStackDepthInfo = _jvmtiMonitorStackDepthInfo;

alias jvmtiThreadGroupInfo = _jvmtiThreadGroupInfo;

alias jvmtiFrameInfo = _jvmtiFrameInfo;

alias jvmtiStackInfo = _jvmtiStackInfo;

alias jvmtiHeapReferenceInfoField = _jvmtiHeapReferenceInfoField;

alias jvmtiHeapReferenceInfoArray = _jvmtiHeapReferenceInfoArray;

alias jvmtiHeapReferenceInfoConstantPool = _jvmtiHeapReferenceInfoConstantPool;

alias jvmtiHeapReferenceInfoStackLocal = _jvmtiHeapReferenceInfoStackLocal;

alias jvmtiHeapReferenceInfoJniLocal = _jvmtiHeapReferenceInfoJniLocal;

alias jvmtiHeapReferenceInfoReserved = _jvmtiHeapReferenceInfoReserved;

alias jvmtiHeapReferenceInfo = _jvmtiHeapReferenceInfo;

alias jvmtiHeapCallbacks = _jvmtiHeapCallbacks;

alias jvmtiClassDefinition = _jvmtiClassDefinition;

alias jvmtiMonitorUsage = _jvmtiMonitorUsage;

alias jvmtiLineNumberEntry = _jvmtiLineNumberEntry;

alias jvmtiLocalVariableEntry = _jvmtiLocalVariableEntry;

alias jvmtiParamInfo = _jvmtiParamInfo;

alias jvmtiExtensionFunctionInfo = _jvmtiExtensionFunctionInfo;

alias jvmtiExtensionEventInfo = _jvmtiExtensionEventInfo;

alias jvmtiTimerInfo = _jvmtiTimerInfo;

alias jvmtiAddrLocationMap = _jvmtiAddrLocationMap;

/* Function Types */

alias jvmtiStartFunction = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, void* arg);

alias jvmtiHeapIterationCallback = int function (jlong class_tag, jlong size, jlong* tag_ptr, jint length, void* user_data);

alias jvmtiHeapReferenceCallback = int function (jvmtiHeapReferenceKind reference_kind, const(jvmtiHeapReferenceInfo)* reference_info, jlong class_tag, jlong referrer_class_tag, jlong size, jlong* tag_ptr, jlong* referrer_tag_ptr, jint length, void* user_data);

alias jvmtiPrimitiveFieldCallback = int function (jvmtiHeapReferenceKind kind, const(jvmtiHeapReferenceInfo)* info, jlong object_class_tag, jlong* object_tag_ptr, jvalue value, jvmtiPrimitiveType value_type, void* user_data);

alias jvmtiArrayPrimitiveValueCallback = int function (jlong class_tag, jlong size, jlong* tag_ptr, jint element_count, jvmtiPrimitiveType element_type, const(void)* elements, void* user_data);

alias jvmtiStringPrimitiveValueCallback = int function (jlong class_tag, jlong size, jlong* tag_ptr, const(jchar)* value, jint value_length, void* user_data);

alias jvmtiReservedCallback = jint function();

alias jvmtiHeapObjectCallback = jvmtiIterationControl function (jlong class_tag, jlong size, jlong* tag_ptr, void* user_data);

alias jvmtiHeapRootCallback = jvmtiIterationControl function (jvmtiHeapRootKind root_kind, jlong class_tag, jlong size, jlong* tag_ptr, void* user_data);

alias jvmtiStackReferenceCallback = jvmtiIterationControl function (jvmtiHeapRootKind root_kind, jlong class_tag, jlong size, jlong* tag_ptr, jlong thread_tag, jint depth, jmethodID method, jint slot, void* user_data);

alias jvmtiObjectReferenceCallback = jvmtiIterationControl function (jvmtiObjectReferenceKind reference_kind, jlong class_tag, jlong size, jlong* tag_ptr, jlong referrer_tag, jint referrer_index, void* user_data);

alias jvmtiExtensionFunction = jvmtiError function (jvmtiEnv* jvmti_env, ...);

alias jvmtiExtensionEvent = void function (jvmtiEnv* jvmti_env, ...);

/* Structure Types */
struct _jvmtiThreadInfo {
    char* name;
    jint priority;
    jboolean is_daemon;
    jthreadGroup thread_group;
    jobject context_class_loader;
}

struct _jvmtiMonitorStackDepthInfo {
    jobject monitor;
    jint stack_depth;
}

struct _jvmtiThreadGroupInfo {
    jthreadGroup parent;
    char* name;
    jint max_priority;
    jboolean is_daemon;
}

struct _jvmtiFrameInfo {
    jmethodID method;
    jlocation location;
}

struct _jvmtiStackInfo {
    jthread thread;
    jint state;
    jvmtiFrameInfo* frame_buffer;
    jint frame_count;
}

struct _jvmtiHeapReferenceInfoField {
    jint index;
}

struct _jvmtiHeapReferenceInfoArray {
    jint index;
}

struct _jvmtiHeapReferenceInfoConstantPool {
    jint index;
}

struct _jvmtiHeapReferenceInfoStackLocal {
    jlong thread_tag;
    jlong thread_id;
    jint depth;
    jmethodID method;
    jlocation location;
    jint slot;
}

struct _jvmtiHeapReferenceInfoJniLocal {
    jlong thread_tag;
    jlong thread_id;
    jint depth;
    jmethodID method;
}

struct _jvmtiHeapReferenceInfoReserved {
    jlong reserved1;
    jlong reserved2;
    jlong reserved3;
    jlong reserved4;
    jlong reserved5;
    jlong reserved6;
    jlong reserved7;
    jlong reserved8;
}

union _jvmtiHeapReferenceInfo {
    jvmtiHeapReferenceInfoField field;
    jvmtiHeapReferenceInfoArray array;
    jvmtiHeapReferenceInfoConstantPool constant_pool;
    jvmtiHeapReferenceInfoStackLocal stack_local;
    jvmtiHeapReferenceInfoJniLocal jni_local;
    jvmtiHeapReferenceInfoReserved other;
}

struct _jvmtiHeapCallbacks {
    jvmtiHeapIterationCallback heap_iteration_callback;
    jvmtiHeapReferenceCallback heap_reference_callback;
    jvmtiPrimitiveFieldCallback primitive_field_callback;
    jvmtiArrayPrimitiveValueCallback array_primitive_value_callback;
    jvmtiStringPrimitiveValueCallback string_primitive_value_callback;
    jvmtiReservedCallback reserved5;
    jvmtiReservedCallback reserved6;
    jvmtiReservedCallback reserved7;
    jvmtiReservedCallback reserved8;
    jvmtiReservedCallback reserved9;
    jvmtiReservedCallback reserved10;
    jvmtiReservedCallback reserved11;
    jvmtiReservedCallback reserved12;
    jvmtiReservedCallback reserved13;
    jvmtiReservedCallback reserved14;
    jvmtiReservedCallback reserved15;
}

struct _jvmtiClassDefinition {
    jclass klass;
    jint class_byte_count;
    const(ubyte)* class_bytes;
}

struct _jvmtiMonitorUsage {
    jthread owner;
    jint entry_count;
    jint waiter_count;
    jthread* waiters;
    jint notify_waiter_count;
    jthread* notify_waiters;
}

struct _jvmtiLineNumberEntry {
    jlocation start_location;
    jint line_number;
}

struct _jvmtiLocalVariableEntry {
    jlocation start_location;
    jint length;
    char* name;
    char* signature;
    char* generic_signature;
    jint slot;
}

struct _jvmtiParamInfo {
    char* name;
    jvmtiParamKind kind;
    jvmtiParamTypes base_type;
    jboolean null_ok;
}

struct _jvmtiExtensionFunctionInfo {
    jvmtiExtensionFunction func;
    char* id;
    char* short_description;
    jint param_count;
    jvmtiParamInfo* params;
    jint error_count;
    jvmtiError* errors;
}

struct _jvmtiExtensionEventInfo {
    jint extension_event_index;
    char* id;
    char* short_description;
    jint param_count;
    jvmtiParamInfo* params;
}

struct _jvmtiTimerInfo {
    jlong max_value;
    jboolean may_skip_forward;
    jboolean may_skip_backward;
    jvmtiTimerKind kind;
    jlong reserved1;
    jlong reserved2;
}

struct _jvmtiAddrLocationMap {
    const(void)* start_address;
    jlocation location;
}

struct jvmtiCapabilities {
    mixin(bitfields!(
        uint, "can_tag_objects", 1,
        uint, "can_generate_field_modification_events", 1,
    	uint, "can_generate_field_access_events", 1,
    	uint, "can_get_bytecodes", 1,
    	uint, "can_get_synthetic_attribute", 1,
    	uint, "can_get_owned_monitor_info", 1,
    	uint, "can_get_current_contended_monitor", 1,
	    uint, "can_get_monitor_info", 1,
    	uint, "can_pop_frame", 1,
    	uint, "can_redefine_classes", 1,
    	uint, "can_signal_thread", 1,
    	uint, "can_get_source_file_name", 1,
    	uint, "can_get_line_numbers", 1,
    	uint, "can_get_source_debug_extension", 1,
    	uint, "can_access_local_variables", 1,
    	uint, "can_maintain_original_method_order", 1));
    mixin(bitfields!(
        uint, "can_generate_single_step_events",  1,
        uint, "can_generate_exception_events", 1,
        uint, "can_generate_frame_pop_events", 1,
        uint, "can_generate_breakpoint_events", 1,
	    uint, "can_suspend", 1,
    	uint, "can_redefine_any_class", 1,
	    uint, "can_get_current_thread_cpu_time", 1,
	    uint, "can_get_thread_cpu_time", 1,
	    uint, "can_generate_method_entry_events", 1,
	    uint, "can_generate_method_exit_events", 1,
	    uint, "can_generate_all_class_hook_events", 1,
	    uint, "can_generate_compiled_method_load_events", 1,
	    uint, "can_generate_monitor_events", 1,
	    uint, "can_generate_vm_object_alloc_events", 1,
	    uint, "can_generate_native_method_bind_events", 1,
	    uint, "can_generate_garbage_collection_events", 1));
	mixin(bitfields!(
	    uint, "can_generate_object_free_events", 1,
	    uint, "can_force_early_return", 1,
	    uint, "can_get_owned_monitor_stack_depth_info", 1,
	    uint, "can_get_constant_pool", 1,
	    uint, "can_set_native_method_prefix", 1,
	    uint, "can_retransform_classes", 1,
	    uint, "can_retransform_any_class", 1,
	    uint, "can_generate_resource_exhaustion_heap_events", 1,
	    uint, "can_generate_resource_exhaustion_threads_events", 1,
	    uint, "_nameless_1", 7));
    mixin(bitfields!(
	    uint, "_nameless_2", 16,
	    uint, "_nameless_3", 16));
	mixin(bitfields!(
	    uint, "_nameless_4", 16,
    	uint, "_nameless_5", 16));
	mixin(bitfields!(uint, "_nameless_6", 16));
}

/* Event Definitions */

alias jvmtiEventReserved = void function ();

alias jvmtiEventBreakpoint = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jmethodID method, jlocation location);

alias jvmtiEventClassFileLoadHook = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jclass class_being_redefined, jobject loader, const(char)* name, jobject protection_domain, jint class_data_len, const(ubyte)* class_data, jint* new_class_data_len, ubyte** new_class_data);

alias jvmtiEventClassLoad = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jclass klass);

alias jvmtiEventClassPrepare = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jclass klass);

alias jvmtiEventCompiledMethodLoad = void function (jvmtiEnv* jvmti_env, jmethodID method, jint code_size, const(void)* code_addr, jint map_length, const(jvmtiAddrLocationMap)* map, const(void)* compile_info);

alias jvmtiEventCompiledMethodUnload = void function (jvmtiEnv* jvmti_env, jmethodID method, const(void)* code_addr);

alias jvmtiEventDataDumpRequest = void function (jvmtiEnv* jvmti_env);

alias jvmtiEventDynamicCodeGenerated = void function (jvmtiEnv* jvmti_env, const(char)* name, const(void)* address, jint length);

alias jvmtiEventException = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jmethodID method, jlocation location, jobject exception, jmethodID catch_method, jlocation catch_location);

alias jvmtiEventExceptionCatch = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jmethodID method, jlocation location, jobject exception);

alias jvmtiEventFieldAccess = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jmethodID method, jlocation location, jclass field_klass, jobject object, jfieldID field);

alias jvmtiEventFieldModification = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jmethodID method, jlocation location, jclass field_klass, jobject object, jfieldID field, char signature_type, jvalue new_value);

alias jvmtiEventFramePop = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jmethodID method, jboolean was_popped_by_exception);

alias jvmtiEventGarbageCollectionFinish = void function (jvmtiEnv* jvmti_env);

alias jvmtiEventGarbageCollectionStart = void function (jvmtiEnv* jvmti_env);

alias jvmtiEventMethodEntry = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jmethodID method);

alias jvmtiEventMethodExit = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jmethodID method, jboolean was_popped_by_exception, jvalue return_value);

alias jvmtiEventMonitorContendedEnter = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jobject object);

alias jvmtiEventMonitorContendedEntered = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jobject object);

alias jvmtiEventMonitorWait = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jobject object, jlong timeout);

alias jvmtiEventMonitorWaited = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jobject object, jboolean timed_out);

alias jvmtiEventNativeMethodBind = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jmethodID method, void* address, void** new_address_ptr);

alias jvmtiEventObjectFree = void function (jvmtiEnv* jvmti_env, jlong tag);

alias jvmtiEventResourceExhausted = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jint flags, const(void)* reserved, const(char)* description);

alias jvmtiEventSingleStep = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jmethodID method, jlocation location);

alias jvmtiEventThreadEnd = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread);

alias jvmtiEventThreadStart = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread);

alias jvmtiEventVMDeath = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env);

alias jvmtiEventVMInit = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread);

alias jvmtiEventVMObjectAlloc = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env, jthread thread, jobject object, jclass object_klass, jlong size);

alias jvmtiEventVMStart = void function (jvmtiEnv* jvmti_env, JNIEnv* jni_env);

/* Event Callback Structure */

struct jvmtiEventCallbacks {
    /*   50 : VM Initialization Event */
    jvmtiEventVMInit VMInit;
    /*   51 : VM Death Event */
    jvmtiEventVMDeath VMDeath;
    /*   52 : Thread Start */
    jvmtiEventThreadStart ThreadStart;
    /*   53 : Thread End */
    jvmtiEventThreadEnd ThreadEnd;
    /*   54 : Class File Load Hook */
    jvmtiEventClassFileLoadHook ClassFileLoadHook;
    /*   55 : Class Load */
    jvmtiEventClassLoad ClassLoad;
    /*   56 : Class Prepare */
    jvmtiEventClassPrepare ClassPrepare;
    /*   57 : VM Start Event */
    jvmtiEventVMStart VMStart;
    /*   58 : Exception */
    jvmtiEventException Exception;
    /*   59 : Exception Catch */
    jvmtiEventExceptionCatch ExceptionCatch;
    /*   60 : Single Step */
    jvmtiEventSingleStep SingleStep;
    /*   61 : Frame Pop */
    jvmtiEventFramePop FramePop;
    /*   62 : Breakpoint */
    jvmtiEventBreakpoint Breakpoint;
    /*   63 : Field Access */
    jvmtiEventFieldAccess FieldAccess;
    /*   64 : Field Modification */
    jvmtiEventFieldModification FieldModification;
    /*   65 : Method Entry */
    jvmtiEventMethodEntry MethodEntry;
    /*   66 : Method Exit */
    jvmtiEventMethodExit MethodExit;
    /*   67 : Native Method Bind */
    jvmtiEventNativeMethodBind NativeMethodBind;
    /*   68 : Compiled Method Load */
    jvmtiEventCompiledMethodLoad CompiledMethodLoad;
    /*   69 : Compiled Method Unload */
    jvmtiEventCompiledMethodUnload CompiledMethodUnload;
    /*   70 : Dynamic Code Generated */
    jvmtiEventDynamicCodeGenerated DynamicCodeGenerated;
    /*   71 : Data Dump Request */
    jvmtiEventDataDumpRequest DataDumpRequest;
    /*   72 */
    jvmtiEventReserved reserved72;
    /*   73 : Monitor Wait */
    jvmtiEventMonitorWait MonitorWait;
    /*   74 : Monitor Waited */
    jvmtiEventMonitorWaited MonitorWaited;
    /*   75 : Monitor Contended Enter */
    jvmtiEventMonitorContendedEnter MonitorContendedEnter;
    /*   76 : Monitor Contended Entered */
    jvmtiEventMonitorContendedEntered MonitorContendedEntered;
    /*   77 */
    jvmtiEventReserved reserved77;
    /*   78 */
    jvmtiEventReserved reserved78;
    /*   79 */
    jvmtiEventReserved reserved79;
    /*   80 : Resource Exhausted */
    jvmtiEventResourceExhausted ResourceExhausted;
    /*   81 : Garbage Collection Start */
    jvmtiEventGarbageCollectionStart GarbageCollectionStart;
    /*   82 : Garbage Collection Finish */
    jvmtiEventGarbageCollectionFinish GarbageCollectionFinish;
    /*   83 : Object Free */
    jvmtiEventObjectFree ObjectFree;
    /*   84 : VM Object Allocation */
    jvmtiEventVMObjectAlloc VMObjectAlloc;
}

/* Function Interface */

struct jvmtiInterface_1_ {
    /*   1 :  RESERVED */
    void* reserved1;

    /*   2 : Set Event Notification Mode */
    jvmtiError function (jvmtiEnv* env, jvmtiEventMode mode, jvmtiEvent event_type, jthread event_thread, ...) SetEventNotificationMode;

    /*   3 :  RESERVED */
    void* reserved3;

    /*   4 : Get All Threads */
    jvmtiError function (jvmtiEnv* env, jint* threads_count_ptr, jthread** threads_ptr) GetAllThreads;

    /*   5 : Suspend Thread */
    jvmtiError function (jvmtiEnv* env, jthread thread) SuspendThread;

    /*   6 : Resume Thread */
    jvmtiError function (jvmtiEnv* env, jthread thread) ResumeThread;

    /*   7 : Stop Thread */
    jvmtiError function (jvmtiEnv* env, jthread thread, jobject exception) StopThread;

    /*   8 : Interrupt Thread */
    jvmtiError function (jvmtiEnv* env, jthread thread) InterruptThread;

    /*   9 : Get Thread Info */
    jvmtiError function (jvmtiEnv* env, jthread thread, jvmtiThreadInfo* info_ptr) GetThreadInfo;

    /*   10 : Get Owned Monitor Info */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint* owned_monitor_count_ptr, jobject** owned_monitors_ptr) GetOwnedMonitorInfo;

    /*   11 : Get Current Contended Monitor */
    jvmtiError function (jvmtiEnv* env, jthread thread, jobject* monitor_ptr) GetCurrentContendedMonitor;

    /*   12 : Run Agent Thread */
    jvmtiError function (jvmtiEnv* env, jthread thread, jvmtiStartFunction proc, const(void)* arg, jint priority) RunAgentThread;

    /*   13 : Get Top Thread Groups */
    jvmtiError function (jvmtiEnv* env, jint* group_count_ptr, jthreadGroup** groups_ptr) GetTopThreadGroups;

    /*   14 : Get Thread Group Info */
    jvmtiError function (jvmtiEnv* env, jthreadGroup group, jvmtiThreadGroupInfo* info_ptr) GetThreadGroupInfo;

    /*   15 : Get Thread Group Children */
    jvmtiError function (jvmtiEnv* env, jthreadGroup group, jint* thread_count_ptr, jthread** threads_ptr, jint* group_count_ptr, jthreadGroup** groups_ptr) GetThreadGroupChildren;

    /*   16 : Get Frame Count */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint* count_ptr) GetFrameCount;

    /*   17 : Get Thread State */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint* thread_state_ptr) GetThreadState;

    /*   18 : Get Current Thread */
    jvmtiError function (jvmtiEnv* env, jthread* thread_ptr) GetCurrentThread;

    /*   19 : Get Frame Location */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint depth, jmethodID* method_ptr, jlocation* location_ptr) GetFrameLocation;

    /*   20 : Notify Frame Pop */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint depth) NotifyFramePop;

    /*   21 : Get Local Variable - Object */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint depth, jint slot, jobject* value_ptr) GetLocalObject;

    /*   22 : Get Local Variable - Int */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint depth, jint slot, jint* value_ptr) GetLocalInt;

    /*   23 : Get Local Variable - Long */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint depth, jint slot, jlong* value_ptr) GetLocalLong;

    /*   24 : Get Local Variable - Float */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint depth, jint slot, jfloat* value_ptr) GetLocalFloat;

    /*   25 : Get Local Variable - Double */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint depth, jint slot, jdouble* value_ptr) GetLocalDouble;

    /*   26 : Set Local Variable - Object */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint depth, jint slot, jobject value) SetLocalObject;

    /*   27 : Set Local Variable - Int */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint depth, jint slot, jint value) SetLocalInt;

    /*   28 : Set Local Variable - Long */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint depth, jint slot, jlong value) SetLocalLong;

    /*   29 : Set Local Variable - Float */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint depth, jint slot, jfloat value) SetLocalFloat;

    /*   30 : Set Local Variable - Double */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint depth, jint slot, jdouble value) SetLocalDouble;

    /*   31 : Create Raw Monitor */
    jvmtiError function (jvmtiEnv* env, const(char)* name, jrawMonitorID* monitor_ptr) CreateRawMonitor;

    /*   32 : Destroy Raw Monitor */
    jvmtiError function (jvmtiEnv* env, jrawMonitorID monitor) DestroyRawMonitor;

    /*   33 : Raw Monitor Enter */
    jvmtiError function (jvmtiEnv* env, jrawMonitorID monitor) RawMonitorEnter;

    /*   34 : Raw Monitor Exit */
    jvmtiError function (jvmtiEnv* env, jrawMonitorID monitor) RawMonitorExit;

    /*   35 : Raw Monitor Wait */
    jvmtiError function (jvmtiEnv* env, jrawMonitorID monitor, jlong millis) RawMonitorWait;

    /*   36 : Raw Monitor Notify */
    jvmtiError function (jvmtiEnv* env, jrawMonitorID monitor) RawMonitorNotify;

    /*   37 : Raw Monitor Notify All */
    jvmtiError function (jvmtiEnv* env, jrawMonitorID monitor) RawMonitorNotifyAll;

    /*   38 : Set Breakpoint */
    jvmtiError function (jvmtiEnv* env, jmethodID method, jlocation location) SetBreakpoint;

    /*   39 : Clear Breakpoint */
    jvmtiError function (jvmtiEnv* env, jmethodID method, jlocation location) ClearBreakpoint;

    /*   40 :  RESERVED */
    void* reserved40;

    /*   41 : Set Field Access Watch */
    jvmtiError function (jvmtiEnv* env, jclass klass, jfieldID field) SetFieldAccessWatch;

    /*   42 : Clear Field Access Watch */
    jvmtiError function (jvmtiEnv* env, jclass klass, jfieldID field) ClearFieldAccessWatch;

    /*   43 : Set Field Modification Watch */
    jvmtiError function (jvmtiEnv* env, jclass klass, jfieldID field) SetFieldModificationWatch;

    /*   44 : Clear Field Modification Watch */
    jvmtiError function (jvmtiEnv* env, jclass klass, jfieldID field) ClearFieldModificationWatch;

    /*   45 : Is Modifiable Class */
    jvmtiError function (jvmtiEnv* env, jclass klass, jboolean* is_modifiable_class_ptr) IsModifiableClass;

    /*   46 : Allocate */
    jvmtiError function (jvmtiEnv* env, jlong size, ubyte** mem_ptr) Allocate;

    /*   47 : Deallocate */
    jvmtiError function (jvmtiEnv* env, ubyte* mem) Deallocate;

    /*   48 : Get Class Signature */
    jvmtiError function (jvmtiEnv* env, jclass klass, char** signature_ptr, char** generic_ptr) GetClassSignature;

    /*   49 : Get Class Status */
    jvmtiError function (jvmtiEnv* env, jclass klass, jint* status_ptr) GetClassStatus;

    /*   50 : Get Source File Name */
    jvmtiError function (jvmtiEnv* env, jclass klass, char** source_name_ptr) GetSourceFileName;

    /*   51 : Get Class Modifiers */
    jvmtiError function (jvmtiEnv* env, jclass klass, jint* modifiers_ptr) GetClassModifiers;

    /*   52 : Get Class Methods */
    jvmtiError function (jvmtiEnv* env, jclass klass, jint* method_count_ptr, jmethodID** methods_ptr) GetClassMethods;

    /*   53 : Get Class Fields */
    jvmtiError function (jvmtiEnv* env, jclass klass, jint* field_count_ptr, jfieldID** fields_ptr) GetClassFields;

    /*   54 : Get Implemented Interfaces */
    jvmtiError function (jvmtiEnv* env, jclass klass, jint* interface_count_ptr, jclass** interfaces_ptr) GetImplementedInterfaces;

    /*   55 : Is Interface */
    jvmtiError function (jvmtiEnv* env, jclass klass, jboolean* is_interface_ptr) IsInterface;

    /*   56 : Is Array Class */
    jvmtiError function (jvmtiEnv* env, jclass klass, jboolean* is_array_class_ptr) IsArrayClass;

    /*   57 : Get Class Loader */
    jvmtiError function (jvmtiEnv* env, jclass klass, jobject* classloader_ptr) GetClassLoader;

    /*   58 : Get Object Hash Code */
    jvmtiError function (jvmtiEnv* env, jobject object, jint* hash_code_ptr) GetObjectHashCode;

    /*   59 : Get Object Monitor Usage */
    jvmtiError function (jvmtiEnv* env, jobject object, jvmtiMonitorUsage* info_ptr) GetObjectMonitorUsage;

    /*   60 : Get Field Name (and Signature) */
    jvmtiError function (jvmtiEnv* env, jclass klass, jfieldID field, char** name_ptr, char** signature_ptr, char** generic_ptr) GetFieldName;

    /*   61 : Get Field Declaring Class */
    jvmtiError function (jvmtiEnv* env, jclass klass, jfieldID field, jclass* declaring_class_ptr) GetFieldDeclaringClass;

    /*   62 : Get Field Modifiers */
    jvmtiError function (jvmtiEnv* env, jclass klass, jfieldID field, jint* modifiers_ptr) GetFieldModifiers;

    /*   63 : Is Field Synthetic */
    jvmtiError function (jvmtiEnv* env, jclass klass, jfieldID field, jboolean* is_synthetic_ptr) IsFieldSynthetic;

    /*   64 : Get Method Name (and Signature) */
    jvmtiError function (jvmtiEnv* env, jmethodID method, char** name_ptr, char** signature_ptr, char** generic_ptr) GetMethodName;

    /*   65 : Get Method Declaring Class */
    jvmtiError function (jvmtiEnv* env, jmethodID method, jclass* declaring_class_ptr) GetMethodDeclaringClass;

    /*   66 : Get Method Modifiers */
    jvmtiError function (jvmtiEnv* env, jmethodID method, jint* modifiers_ptr) GetMethodModifiers;

    /*   67 :  RESERVED */
    void* reserved67;

    /*   68 : Get Max Locals */
    jvmtiError function (jvmtiEnv* env, jmethodID method, jint* max_ptr) GetMaxLocals;

    /*   69 : Get Arguments Size */
    jvmtiError function (jvmtiEnv* env, jmethodID method, jint* size_ptr) GetArgumentsSize;

    /*   70 : Get Line Number Table */
    jvmtiError function (jvmtiEnv* env, jmethodID method, jint* entry_count_ptr, jvmtiLineNumberEntry** table_ptr) GetLineNumberTable;

    /*   71 : Get Method Location */
    jvmtiError function (jvmtiEnv* env, jmethodID method, jlocation* start_location_ptr, jlocation* end_location_ptr) GetMethodLocation;

    /*   72 : Get Local Variable Table */
    jvmtiError function (jvmtiEnv* env, jmethodID method, jint* entry_count_ptr, jvmtiLocalVariableEntry** table_ptr) GetLocalVariableTable;

    /*   73 : Set Native Method Prefix */
    jvmtiError function (jvmtiEnv* env, const(char)* prefix) SetNativeMethodPrefix;

    /*   74 : Set Native Method Prefixes */
    jvmtiError function (jvmtiEnv* env, jint prefix_count, char** prefixes) SetNativeMethodPrefixes;

    /*   75 : Get Bytecodes */
    jvmtiError function (jvmtiEnv* env, jmethodID method, jint* bytecode_count_ptr, ubyte** bytecodes_ptr) GetBytecodes;

    /*   76 : Is Method Native */
    jvmtiError function (jvmtiEnv* env, jmethodID method, jboolean* is_native_ptr) IsMethodNative;

    /*   77 : Is Method Synthetic */
    jvmtiError function (jvmtiEnv* env, jmethodID method, jboolean* is_synthetic_ptr) IsMethodSynthetic;

    /*   78 : Get Loaded Classes */
    jvmtiError function (jvmtiEnv* env, jint* class_count_ptr, jclass** classes_ptr) GetLoadedClasses;

    /*   79 : Get Classloader Classes */
    jvmtiError function (jvmtiEnv* env, jobject initiating_loader, jint* class_count_ptr, jclass** classes_ptr) GetClassLoaderClasses;

    /*   80 : Pop Frame */
    jvmtiError function (jvmtiEnv* env, jthread thread) PopFrame;

    /*   81 : Force Early Return - Object */
    jvmtiError function (jvmtiEnv* env, jthread thread, jobject value) ForceEarlyReturnObject;

    /*   82 : Force Early Return - Int */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint value) ForceEarlyReturnInt;

    /*   83 : Force Early Return - Long */
    jvmtiError function (jvmtiEnv* env, jthread thread, jlong value) ForceEarlyReturnLong;

    /*   84 : Force Early Return - Float */
    jvmtiError function (jvmtiEnv* env, jthread thread, jfloat value) ForceEarlyReturnFloat;

    /*   85 : Force Early Return - Double */
    jvmtiError function (jvmtiEnv* env, jthread thread, jdouble value) ForceEarlyReturnDouble;

    /*   86 : Force Early Return - Void */
    jvmtiError function (jvmtiEnv* env, jthread thread) ForceEarlyReturnVoid;

    /*   87 : Redefine Classes */
    jvmtiError function (jvmtiEnv* env, jint class_count, const(jvmtiClassDefinition)* class_definitions) RedefineClasses;

    /*   88 : Get Version Number */
    jvmtiError function (jvmtiEnv* env, jint* version_ptr) GetVersionNumber;

    /*   89 : Get Capabilities */
    jvmtiError function (jvmtiEnv* env, jvmtiCapabilities* capabilities_ptr) GetCapabilities;

    /*   90 : Get Source Debug Extension */
    jvmtiError function (jvmtiEnv* env, jclass klass, char** source_debug_extension_ptr) GetSourceDebugExtension;

    /*   91 : Is Method Obsolete */
    jvmtiError function (jvmtiEnv* env, jmethodID method, jboolean* is_obsolete_ptr) IsMethodObsolete;

    /*   92 : Suspend Thread List */
    jvmtiError function (jvmtiEnv* env, jint request_count, const(jthread)* request_list, jvmtiError* results) SuspendThreadList;

    /*   93 : Resume Thread List */
    jvmtiError function (jvmtiEnv* env, jint request_count, const(jthread)* request_list, jvmtiError* results) ResumeThreadList;

    /*   94 :  RESERVED */
    void* reserved94;

    /*   95 :  RESERVED */
    void* reserved95;

    /*   96 :  RESERVED */
    void* reserved96;

    /*   97 :  RESERVED */
    void* reserved97;

    /*   98 :  RESERVED */
    void* reserved98;

    /*   99 :  RESERVED */
    void* reserved99;

    /*   100 : Get All Stack Traces */
    jvmtiError function (jvmtiEnv* env, jint max_frame_count, jvmtiStackInfo** stack_info_ptr, jint* thread_count_ptr) GetAllStackTraces;

    /*   101 : Get Thread List Stack Traces */
    jvmtiError function (jvmtiEnv* env, jint thread_count, const(jthread)* thread_list, jint max_frame_count, jvmtiStackInfo** stack_info_ptr) GetThreadListStackTraces;

    /*   102 : Get Thread Local Storage */
    jvmtiError function (jvmtiEnv* env, jthread thread, void** data_ptr) GetThreadLocalStorage;

    /*   103 : Set Thread Local Storage */
    jvmtiError function (jvmtiEnv* env, jthread thread, const(void)* data) SetThreadLocalStorage;

    /*   104 : Get Stack Trace */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint start_depth, jint max_frame_count, jvmtiFrameInfo* frame_buffer, jint* count_ptr) GetStackTrace;

    /*   105 :  RESERVED */
    void* reserved105;

    /*   106 : Get Tag */
    jvmtiError function (jvmtiEnv* env, jobject object, jlong* tag_ptr) GetTag;

    /*   107 : Set Tag */
    jvmtiError function (jvmtiEnv* env, jobject object, jlong tag) SetTag;

    /*   108 : Force Garbage Collection */
    jvmtiError function (jvmtiEnv* env) ForceGarbageCollection;

    /*   109 : Iterate Over Objects Reachable From Object */
    jvmtiError function (jvmtiEnv* env, jobject object, jvmtiObjectReferenceCallback object_reference_callback, const(void)* user_data) IterateOverObjectsReachableFromObject;

    /*   110 : Iterate Over Reachable Objects */
    jvmtiError function (jvmtiEnv* env, jvmtiHeapRootCallback heap_root_callback, jvmtiStackReferenceCallback stack_ref_callback, jvmtiObjectReferenceCallback object_ref_callback, const(void)* user_data) IterateOverReachableObjects;

    /*   111 : Iterate Over Heap */
    jvmtiError function (jvmtiEnv* env, jvmtiHeapObjectFilter object_filter, jvmtiHeapObjectCallback heap_object_callback, const(void)* user_data) IterateOverHeap;

    /*   112 : Iterate Over Instances Of Class */
    jvmtiError function (jvmtiEnv* env, jclass klass, jvmtiHeapObjectFilter object_filter, jvmtiHeapObjectCallback heap_object_callback, const(void)* user_data) IterateOverInstancesOfClass;

    /*   113 :  RESERVED */
    void* reserved113;

    /*   114 : Get Objects With Tags */
    jvmtiError function (jvmtiEnv* env, jint tag_count, const(jlong)* tags, jint* count_ptr, jobject** object_result_ptr, jlong** tag_result_ptr) GetObjectsWithTags;

    /*   115 : Follow References */
    jvmtiError function (jvmtiEnv* env, jint heap_filter, jclass klass, jobject initial_object, const(jvmtiHeapCallbacks)* callbacks, const(void)* user_data) FollowReferences;

    /*   116 : Iterate Through Heap */
    jvmtiError function (jvmtiEnv* env, jint heap_filter, jclass klass, const(jvmtiHeapCallbacks)* callbacks, const(void)* user_data) IterateThroughHeap;

    /*   117 :  RESERVED */
    void* reserved117;

    /*   118 :  RESERVED */
    void* reserved118;

    /*   119 :  RESERVED */
    void* reserved119;

    /*   120 : Set JNI Function Table */
    jvmtiError function (jvmtiEnv* env, const(jniNativeInterface)* function_table) SetJNIFunctionTable;

    /*   121 : Get JNI Function Table */
    jvmtiError function (jvmtiEnv* env, jniNativeInterface** function_table) GetJNIFunctionTable;

    /*   122 : Set Event Callbacks */
    jvmtiError function (jvmtiEnv* env, const(jvmtiEventCallbacks)* callbacks, jint size_of_callbacks) SetEventCallbacks;

    /*   123 : Generate Events */
    jvmtiError function (jvmtiEnv* env, jvmtiEvent event_type) GenerateEvents;

    /*   124 : Get Extension Functions */
    jvmtiError function (jvmtiEnv* env, jint* extension_count_ptr, jvmtiExtensionFunctionInfo** extensions) GetExtensionFunctions;

    /*   125 : Get Extension Events */
    jvmtiError function (jvmtiEnv* env, jint* extension_count_ptr, jvmtiExtensionEventInfo** extensions) GetExtensionEvents;

    /*   126 : Set Extension Event Callback */
    jvmtiError function (jvmtiEnv* env, jint extension_event_index, jvmtiExtensionEvent callback) SetExtensionEventCallback;

    /*   127 : Dispose Environment */
    jvmtiError function (jvmtiEnv* env) DisposeEnvironment;

    /*   128 : Get Error Name */
    jvmtiError function (jvmtiEnv* env, jvmtiError error, char** name_ptr) GetErrorName;

    /*   129 : Get JLocation Format */
    jvmtiError function (jvmtiEnv* env, jvmtiJlocationFormat* format_ptr) GetJLocationFormat;

    /*   130 : Get System Properties */
    jvmtiError function (jvmtiEnv* env, jint* count_ptr, char*** property_ptr) GetSystemProperties;

    /*   131 : Get System Property */
    jvmtiError function (jvmtiEnv* env, const(char)* property, char** value_ptr) GetSystemProperty;

    /*   132 : Set System Property */
    jvmtiError function (jvmtiEnv* env, const(char)* property, const(char)* value) SetSystemProperty;

    /*   133 : Get Phase */
    jvmtiError function (jvmtiEnv* env, jvmtiPhase* phase_ptr) GetPhase;

    /*   134 : Get Current Thread CPU Timer Information */
    jvmtiError function (jvmtiEnv* env, jvmtiTimerInfo* info_ptr) GetCurrentThreadCpuTimerInfo;

    /*   135 : Get Current Thread CPU Time */
    jvmtiError function (jvmtiEnv* env, jlong* nanos_ptr) GetCurrentThreadCpuTime;

    /*   136 : Get Thread CPU Timer Information */
    jvmtiError function (jvmtiEnv* env, jvmtiTimerInfo* info_ptr) GetThreadCpuTimerInfo;

    /*   137 : Get Thread CPU Time */
    jvmtiError function (jvmtiEnv* env, jthread thread, jlong* nanos_ptr) GetThreadCpuTime;

    /*   138 : Get Timer Information */
    jvmtiError function (jvmtiEnv* env, jvmtiTimerInfo* info_ptr) GetTimerInfo;

    /*   139 : Get Time */
    jvmtiError function (jvmtiEnv* env, jlong* nanos_ptr) GetTime;

    /*   140 : Get Potential Capabilities */
    jvmtiError function (jvmtiEnv* env, jvmtiCapabilities* capabilities_ptr) GetPotentialCapabilities;

    /*   141 :  RESERVED */
    void* reserved141;

    /*   142 : Add Capabilities */
    jvmtiError function (jvmtiEnv* env, const(jvmtiCapabilities)* capabilities_ptr) AddCapabilities;

    /*   143 : Relinquish Capabilities */
    jvmtiError function (jvmtiEnv* env, const(jvmtiCapabilities)* capabilities_ptr) RelinquishCapabilities;

    /*   144 : Get Available Processors */
    jvmtiError function (jvmtiEnv* env, jint* processor_count_ptr) GetAvailableProcessors;

    /*   145 : Get Class Version Numbers */
    jvmtiError function (jvmtiEnv* env, jclass klass, jint* minor_version_ptr, jint* major_version_ptr) GetClassVersionNumbers;

    /*   146 : Get Constant Pool */
    jvmtiError function (jvmtiEnv* env, jclass klass, jint* constant_pool_count_ptr, jint* constant_pool_byte_count_ptr, ubyte** constant_pool_bytes_ptr) GetConstantPool;

    /*   147 : Get Environment Local Storage */
    jvmtiError function (jvmtiEnv* env, void** data_ptr) GetEnvironmentLocalStorage;

    /*   148 : Set Environment Local Storage */
    jvmtiError function (jvmtiEnv* env, const(void)* data) SetEnvironmentLocalStorage;

    /*   149 : Add To Bootstrap Class Loader Search */
    jvmtiError function (jvmtiEnv* env, const(char)* segment) AddToBootstrapClassLoaderSearch;

    /*   150 : Set Verbose Flag */
    jvmtiError function (jvmtiEnv* env, jvmtiVerboseFlag flag, jboolean value) SetVerboseFlag;

    /*   151 : Add To System Class Loader Search */
    jvmtiError function (jvmtiEnv* env, const(char)* segment) AddToSystemClassLoaderSearch;

    /*   152 : Retransform Classes */
    jvmtiError function (jvmtiEnv* env, jint class_count, const(jclass)* classes) RetransformClasses;

    /*   153 : Get Owned Monitor Stack Depth Info */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint* monitor_info_count_ptr, jvmtiMonitorStackDepthInfo** monitor_info_ptr) GetOwnedMonitorStackDepthInfo;

    /*   154 : Get Object Size */
    jvmtiError function (jvmtiEnv* env, jobject object, jlong* size_ptr) GetObjectSize;

    /*   155 : Get Local Instance */
    jvmtiError function (jvmtiEnv* env, jthread thread, jint depth, jobject* value_ptr) GetLocalInstance;
}

alias jvmtiInterface_1 = jvmtiInterface_1_;

struct _jvmtiEnv {
    const(jvmtiInterface_1_)* functions;
}

/* !_JAVA_JVMTI_H_ */
