const std = @import("std");

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();
    var buf:[10]u8 = undefined;

    try stdout.print("Introduce un numero: ", .{});
    if(try stdin.readUntilDelimiterOrEof(buf[0..], '\n')) |user_input| {
        const trim = std.mem.trim(u8, user_input, "\r\n");
        try stdout.print("{s}",.{trim});
    }

}
