//
//  UnimplementedDatabaseReader.swift
//  UnimplementedGRDB
//
//  Created by Rhys Morgan on 29/08/2024.
//

import IssueReporting
@preconcurrency import GRDB

// A type that provides read-only access to a database
public protocol DatabaseReaderProvider {
  /// Provides read-only access to the database.
  @MainActor var reader: any DatabaseReader { get throws }
}

public struct UnimplementedDatabaseReaderProvider: DatabaseReaderProvider {
  public init() {}

  public var reader: any DatabaseReader {
    get throws {
      throw UnimplementedFailure(description: "UnimplementedDatabaseReaderProvider.reader")
    }
  }
}

public extension DatabaseReaderProvider where Self: DatabaseReader {
  @MainActor var reader: any DatabaseReader { self }
}

extension AnyDatabaseReader: DatabaseReaderProvider {}
extension DatabaseQueue: DatabaseReaderProvider {}
extension DatabasePool: DatabaseReaderProvider {}
extension DatabaseSnapshot: DatabaseReaderProvider {}
extension DatabaseSnapshotPool: DatabaseReaderProvider {}

public extension DatabaseReaderProvider where Self == UnimplementedDatabaseReaderProvider {
  static var unimplemented: Self { Self() }
}
