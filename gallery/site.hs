--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll


--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match (fromList ["about.rst", "contact.markdown"]) $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    -- http://javran.github.io/posts/2014-03-01-add-tags-to-your-hakyll-blog.html
    tags <- buildTags "theme/*" (fromCapture "tags/*.html")

    tagsRules tags $ \tag pattern -> do   
      let title = "Themes tagged \'" ++ tag ++ "\'" 
      route idRoute 
      compile $ do 
          posts <- recentFirst =<< loadAll pattern 
          let ctx = 
                constField "title" title `mappend` 
                listField "posts" postCtx (return posts) `mappend`
                defaultContext 

          makeItem "" 
              >>= loadAndApplyTemplate "templates/tag.html" ctx 
              >>= loadAndApplyTemplate "templates/default.html" ctx 
              >>= relativizeUrls

    match "theme/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html"    (postCtxWithTags tags)
            >>= loadAndApplyTemplate "templates/default.html" (postCtxWithTags tags)
            >>= relativizeUrls

    create ["archive.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Archives"            `mappend`
                    mainImgCtx <>
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx 
                >>= relativizeUrls


    match "index.html" $ do
        route idRoute
        compile $ do
            posts <- fmap (take 10) . recentFirst =<< 
              loadAll "theme/*"
            let indexCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Recent Themes"      `mappend`
                    defaultContext

            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    mainImgCtx `mappend`
    downloadCtx `mappend`
    demoUrlCtx `mappend`
    defaultContext

postCtxWithTags :: Tags -> Context String 
postCtxWithTags tags = tagsField "tags" tags `mappend` postCtx

mainImgCtx :: Context String 
mainImgCtx = 
  field 
    "cover" 
    (\item -> do 
      identifier <- getUnderlying 
      mainImg <- getMetadataField identifier "cover" 
      case mainImg of 
        Nothing -> return "blank.png" 
        Just t  -> return t 
   ) 


demoUrlCtx :: Context String 
demoUrlCtx = 
  field 
    "demoUrl" 
    (\item -> do 
      identifier <- getUnderlying 
      mainImg <- getMetadataField identifier "demo" 
      case mainImg of 
        Nothing -> return "" 
        Just t  -> return t 
   ) 

downloadCtx :: Context String
downloadCtx = 
  field 
    "downloadUrl" 
    (\item -> do 
      identifier <- getUnderlying 
      mainImg <- getMetadataField identifier "download" 
      case mainImg of 
        Nothing -> return "" 
        Just t  -> return t 
   ) 