// Builds static .html files from a template.

package main
import (
    "fmt"
    "io/ioutil"
    "strings"
    "path/filepath"
    "os"
    fm "github.com/ericaro/frontmatter"
    "time"
    "sort"
    "strconv"
)

// config
const source_dir            string  = "src/"
const template_path         string  = "static/template.html"
const target_dir            string  = "public/"

// blog config
const blog_template_path    string  = "static/blog-template.html"
const blog_target_dir       string  = "public/blog/"
const date_input            string  = "2006-01-02"
const date_output           string  = "January 2, 2006"
const posts_per_page         int     = 5

var page_template   string
var blog_template   string

type Page struct {
	Title   string  `yaml:"title"`
	IsBlog  bool    `yaml:"blog"`
	Date    string  `yaml:"date"`
	Content string  `fm:"content" yaml:"-"`
    Path    string
    DateObj time.Time
}

var blog_posts = make([]Page, 0)

// Load a file with path ``name`` as a string.
func load_file(name string) string {
    file, _ := ioutil.ReadFile(name)
    return string(file)
}

// Write string ``text`` to path ``name``.
func write_file(name string, text string) {
    content := []byte(text)
    ioutil.WriteFile(name, content, 0644)
}

// Build a given ``.html`` file with appropriate FrontMatter into a proper web page.
func build_page(path string, info os.FileInfo, err error) error {
    if info.IsDir() {
        return nil
    }

    text := load_file(path)
    post := new(Page)
    fm.Unmarshal(([]byte)(text), post)
    pieces := strings.SplitN(path, "/", 2)
    post.Path = pieces[len(pieces)-1]

    var formatted_text string

    if post.IsBlog {
        formatted_text = strings.Replace(blog_template, "TITLE", post.Title, -1)
        formatted_text = strings.Replace(formatted_text, "CONTENT", post.Content, -1)
        post.DateObj, _ = time.Parse(date_input, post.Date)
        formatted_text = strings.Replace(formatted_text, "DATE", post.DateObj.Format(date_output), -1)

        post.Path = blog_target_dir + post.Path
        blog_posts = append(blog_posts, *post)
    } else {
        formatted_text = strings.Replace(page_template, "TITLE", post.Title, -1)
        formatted_text = strings.Replace(formatted_text, "CONTENT", post.Content, -1)
        post.Path = target_dir + post.Path
    }

    fmt.Println("Building " + post.Path)
    write_file(post.Path, formatted_text)
    return nil
}

func main() {
    page_template = load_file(template_path)
    blog_template = load_file(blog_template_path)

    filepath.Walk(source_dir, build_page)

    // All we need to do now is build the blogroll.
    sort.Slice(blog_posts, func(i, j int) bool {
        return blog_posts[i].DateObj.After(blog_posts[j].DateObj)
    })

    // This is a bit messy, but gets the job done.
    current_page := "<h1 class='blogroll-header'>Blog</h1>"
    count := 0
    page_num := 0
    for idx := 0; idx < len(blog_posts); idx++ {
        post := blog_posts[idx]

        current_page = current_page + "<div class='blogroll-container'><h2><a class='blogroll-title' href='../" + post.Path  + "'>" + post.Title + "</a></h2><i>"
        current_page = current_page + post.DateObj.Format(date_output) + "</i>" + post.Content + "</div>"

        count++
        if (count == posts_per_page) || (idx + 1 == len(blog_posts)) {
            page_num++
            if page_num > 1 {
                current_page = current_page + "<div class='previous-link'><a href='blog_p" + strconv.Itoa(page_num - 1) + ".html'>previous</a></div>"
            }

            if idx + 1 < len(blog_posts) {
                current_page = current_page + "<div class='next-link'><a href='blog_p" + strconv.Itoa(page_num + 1) + ".html'>next</a></div>"
            }

            formatted_text := strings.Replace(page_template, "TITLE", "Blogroll", -1)
            formatted_text = strings.Replace(formatted_text, "CONTENT", current_page, -1)
            fmt.Println("Building " + target_dir + "blog_p" + strconv.Itoa(page_num) + ".html")
            write_file(target_dir + "blog_p" + strconv.Itoa(page_num) + ".html", formatted_text)
            current_page = "<h1 class='blogroll-header'>Blog</h1>"
        }
    }
}
