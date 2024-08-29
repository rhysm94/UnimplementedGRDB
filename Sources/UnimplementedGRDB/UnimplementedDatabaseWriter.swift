//
//  UnimplementedDatabaseWriter.swift
//  UnimplementedGRDB
//
//  Created by Rhys Morgan on 29/08/2024.
//

import IssueReporting
@preconcurrency import GRDB

// A type that provides write access to a database
public protocol DatabaseWriterProvider {
  /// Provides read/write access to the database.
  @MainActor var writer: any DatabaseWriter { get throws }
}

public struct UnimplementedDatabaseWriterProvider: DatabaseWriterProvider {
  public init() {}

  public var writer: any DatabaseWriter {
    get throws {
      throw UnimplementedFailure(description: "UnimplementedDatabaseWriterProvider.writer")
    }
  }
}

public extension DatabaseWriterProvider where Self: DatabaseWriter {
  @MainActor var writer: any DatabaseWriter { self }
}

extension AnyDatabaseWriter: DatabaseReaderProvider {}
extension DatabaseQueue: DatabaseWriterProvider {}
extension DatabasePool: DatabaseWriterProvider {}

public extension DatabaseWriterProvider where Self == UnimplementedDatabaseWriterProvider {
  static var unimplemented: Self { Self() }
}
