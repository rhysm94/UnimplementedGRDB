//
//  UnimplementedDatabaseWriter.swift
//  UnimplementedGRDB
//
//  Created by Rhys Morgan on 29/08/2024.
//

import IssueReporting
@preconcurrency import GRDB

// A type that provides write access to a database
public protocol DatabaseWriterProvider: DatabaseReaderProvider {
  /// Provides read/write access to the database.
  @MainActor var writer: any DatabaseWriter { get throws }
}

public struct UnimplementedDatabaseWriterProvider: DatabaseWriterProvider {
  public init() {}

  public var reader: any DatabaseReader {
    get throws {
      reportIssue("An unimplemented DatabaseWriterProvider was accessed.")
      throw UnimplementedFailure(description: "UnimplementedDatabaseWriterProvider.reader")
    }
  }

  public var writer: any DatabaseWriter {
    get throws {
      reportIssue("An unimplemented DatabaseWriterProvider was accessed.")
      throw UnimplementedFailure(description: "UnimplementedDatabaseWriterProvider.writer")
    }
  }
}

public extension DatabaseWriterProvider where Self: DatabaseWriter {
  @MainActor var writer: any DatabaseWriter { self }
}

extension AnyDatabaseWriter: DatabaseWriterProvider {}
extension DatabaseQueue: DatabaseWriterProvider {}
extension DatabasePool: DatabaseWriterProvider {}

public extension DatabaseWriterProvider where Self == UnimplementedDatabaseWriterProvider {
  static var unimplemented: Self { Self() }
}
