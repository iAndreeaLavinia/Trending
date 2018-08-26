//  This file was automatically generated and should not be edited.

import Apollo

public final class SearchRepositoriesQuery: GraphQLQuery {
  public let operationDefinition =
    "query SearchRepositories($query: String!, $count: Int!) {\n  search(query: $query, type: REPOSITORY, first: $count) {\n    __typename\n    edges {\n      __typename\n      node {\n        __typename\n        ... on Repository {\n          ...RepositoryDetails\n        }\n      }\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(RepositoryDetails.fragmentDefinition) }

  public var query: String
  public var count: Int

  public init(query: String, count: Int) {
    self.query = query
    self.count = count
  }

  public var variables: GraphQLMap? {
    return ["query": query, "count": count]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("search", arguments: ["query": GraphQLVariable("query"), "type": "REPOSITORY", "first": GraphQLVariable("count")], type: .nonNull(.object(Search.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.resultMap])
    }

    /// Perform a search across resources.
    public var search: Search {
      get {
        return Search(unsafeResultMap: resultMap["search"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes = ["SearchResultItemConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "SearchResultItemConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["SearchResultItemEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .object(Node.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "SearchResultItemEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Issue", "PullRequest", "Repository", "User", "Organization", "MarketplaceListing"]

          public static let selections: [GraphQLSelection] = [
            GraphQLTypeCase(
              variants: ["Repository": AsRepository.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]
            )
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public static func makeIssue() -> Node {
            return Node(unsafeResultMap: ["__typename": "Issue"])
          }

          public static func makePullRequest() -> Node {
            return Node(unsafeResultMap: ["__typename": "PullRequest"])
          }

          public static func makeUser() -> Node {
            return Node(unsafeResultMap: ["__typename": "User"])
          }

          public static func makeOrganization() -> Node {
            return Node(unsafeResultMap: ["__typename": "Organization"])
          }

          public static func makeMarketplaceListing() -> Node {
            return Node(unsafeResultMap: ["__typename": "MarketplaceListing"])
          }

          public static func makeRepository(name: String, owner: AsRepository.Owner, stargazers: AsRepository.Stargazer, url: String) -> Node {
            return Node(unsafeResultMap: ["__typename": "Repository", "name": name, "owner": owner.resultMap, "stargazers": stargazers.resultMap, "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var asRepository: AsRepository? {
            get {
              if !AsRepository.possibleTypes.contains(__typename) { return nil }
              return AsRepository(unsafeResultMap: resultMap)
            }
            set {
              guard let newValue = newValue else { return }
              resultMap = newValue.resultMap
            }
          }

          public struct AsRepository: GraphQLSelectionSet {
            public static let possibleTypes = ["Repository"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
              GraphQLField("stargazers", type: .nonNull(.object(Stargazer.selections))),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, owner: Owner, stargazers: Stargazer, url: String) {
              self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "owner": owner.resultMap, "stargazers": stargazers.resultMap, "url": url])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The name of the repository.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// The User owner of the repository.
            public var owner: Owner {
              get {
                return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "owner")
              }
            }

            /// A list of users who have starred this starrable.
            public var stargazers: Stargazer {
              get {
                return Stargazer(unsafeResultMap: resultMap["stargazers"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "stargazers")
              }
            }

            /// The HTTP URL for this repository
            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var repositoryDetails: RepositoryDetails {
                get {
                  return RepositoryDetails(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }

            public struct Owner: GraphQLSelectionSet {
              public static let possibleTypes = ["Organization", "User"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("resourcePath", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public static func makeOrganization(resourcePath: String, avatarUrl: String) -> Owner {
                return Owner(unsafeResultMap: ["__typename": "Organization", "resourcePath": resourcePath, "avatarUrl": avatarUrl])
              }

              public static func makeUser(resourcePath: String, avatarUrl: String) -> Owner {
                return Owner(unsafeResultMap: ["__typename": "User", "resourcePath": resourcePath, "avatarUrl": avatarUrl])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The HTTP URL for the owner.
              public var resourcePath: String {
                get {
                  return resultMap["resourcePath"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "resourcePath")
                }
              }

              /// A URL pointing to the owner's public avatar.
              public var avatarUrl: String {
                get {
                  return resultMap["avatarUrl"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "avatarUrl")
                }
              }
            }

            public struct Stargazer: GraphQLSelectionSet {
              public static let possibleTypes = ["StargazerConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(totalCount: Int) {
                self.init(unsafeResultMap: ["__typename": "StargazerConnection", "totalCount": totalCount])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the total count of items in the connection.
              public var totalCount: Int {
                get {
                  return resultMap["totalCount"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "totalCount")
                }
              }
            }
          }
        }
      }
    }
  }
}

public struct RepositoryDetails: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment RepositoryDetails on Repository {\n  __typename\n  name\n  owner {\n    __typename\n    resourcePath\n    avatarUrl\n  }\n  stargazers {\n    __typename\n    totalCount\n  }\n  url\n}"

  public static let possibleTypes = ["Repository"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
    GraphQLField("stargazers", type: .nonNull(.object(Stargazer.selections))),
    GraphQLField("url", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(name: String, owner: Owner, stargazers: Stargazer, url: String) {
    self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "owner": owner.resultMap, "stargazers": stargazers.resultMap, "url": url])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The name of the repository.
  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// The User owner of the repository.
  public var owner: Owner {
    get {
      return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "owner")
    }
  }

  /// A list of users who have starred this starrable.
  public var stargazers: Stargazer {
    get {
      return Stargazer(unsafeResultMap: resultMap["stargazers"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "stargazers")
    }
  }

  /// The HTTP URL for this repository
  public var url: String {
    get {
      return resultMap["url"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "url")
    }
  }

  public struct Owner: GraphQLSelectionSet {
    public static let possibleTypes = ["Organization", "User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("resourcePath", type: .nonNull(.scalar(String.self))),
      GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public static func makeOrganization(resourcePath: String, avatarUrl: String) -> Owner {
      return Owner(unsafeResultMap: ["__typename": "Organization", "resourcePath": resourcePath, "avatarUrl": avatarUrl])
    }

    public static func makeUser(resourcePath: String, avatarUrl: String) -> Owner {
      return Owner(unsafeResultMap: ["__typename": "User", "resourcePath": resourcePath, "avatarUrl": avatarUrl])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The HTTP URL for the owner.
    public var resourcePath: String {
      get {
        return resultMap["resourcePath"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "resourcePath")
      }
    }

    /// A URL pointing to the owner's public avatar.
    public var avatarUrl: String {
      get {
        return resultMap["avatarUrl"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "avatarUrl")
      }
    }
  }

  public struct Stargazer: GraphQLSelectionSet {
    public static let possibleTypes = ["StargazerConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int) {
      self.init(unsafeResultMap: ["__typename": "StargazerConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int {
      get {
        return resultMap["totalCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }
}