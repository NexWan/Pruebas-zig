const std = @import("std");
const AllocationError = error{OutOfMemory};
const AccessDeniedError = error{AccessDenied};
const print = std.debug.print;
const fileError = error{
    AccessDenied,
    OutOfMemory,
    FileNotFound,
};
const File = std.fs.cwd;
const expect = std.testing.expect;

pub fn main() !void {
    print("Valor de fibo: {d}", .{fibo(10)});
    //const err: fileError = AccessDeniedError.AccessDenied;
    var file = try File().createFile(
        "archivoxd.txt",
        .{ .read = true },
    );
    defer file.close(); //Se tiene que cerrar el archivo en Zig, de esa forma no ocupara memoria incesaria
    const createFile = try file.writeAll("Ola jeje \n comota");
    _ = createFile;
    file = try File().openFile("archivoxd.txt", .{});
    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();
    var buf: [1024]u8 = undefined;
    while (try in_stream.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        print("Hola: {s} \n", .{line});
    }
}

pub fn fibo(x: i32) i32 {
    if (x == 0) return 0 else if (x == 1) return 1 else return (fibo(x - 1) + fibo(x - 2));
}
