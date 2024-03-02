const std = @import("std");
const print = std.debug.print;
const path = "text";
const File = std.fs.cwd;
const Dir = std.fs.Dir;
const OpenError: type = error{
    FileNotFound,
    NotDir,
    AccessDenied,
    SymLinkLoop,
    ProcessFdQuotaExceeded,
    NameTooLong,
    SystemFdQuotaExceeded,
    NoDevice,
    SystemResources,
    InvalidUtf8,
    InvalidWtf8,
    BadPathName,
    DeviceBusy,
    NetworkNotFound,
    Unexpected,
    DiskQuota,
    PathAlreadyExists,
    LinkQuotaExceeded,
    NoSpaceLeft,
    ReadOnlyFileSystem,
};

pub fn main() !void {
    print("{s}", .{path});
    const openDir = File().openDir(path, .{});
    _ = openDir catch |err| {
        if (err == error.FileNotFound) {
            print("Hola",.{});
            const x: OpenError!void = File().makeDir(path);
            _ = x catch |errr| {
                print("{s}", .{@errorName(errr)});
            };
        }
    };
}
