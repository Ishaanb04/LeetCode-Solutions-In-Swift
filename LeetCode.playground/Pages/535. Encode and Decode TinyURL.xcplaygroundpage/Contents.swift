// 535. Encode and Decode TinyURL
// https://leetcode.com/problems/encode-and-decode-tinyurl/description/
class Codec {
    var encodeMap = [String: String]()
    var decodeMap = [String: String]()
    var baseURL = "tinyurl.com/"
    // Encodes a URL to a shortened URL.
    func encode(_ longUrl: String) -> String {
        if let short = encodeMap[longUrl] {
            return short
        }
        let shortUrl = "\(baseURL)\(encodeMap.count + 1)"
        encodeMap[longUrl] = shortUrl
        decodeMap[shortUrl] = longUrl
        return shortUrl
    }

    // Decodes a shortened URL to its original URL.
    func decode(_ shortUrl: String) -> String {
        return decodeMap[shortUrl] ?? ""
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(longUrl)
 * let ans = obj.decode(s)
 */
